#!/usr/bin/env bash
# Claude Code status line: model | dir | context bar | 5h limit | weekly limit | session cost
input=$(cat)

IFS=$'\x1f' read -r model dir ctx_pct ctx_used ctx_size five_pct five_reset week_pct week_reset cost < <(
  jq -r '[
    (.model.display_name // "Claude"),
    (.workspace.current_dir // .cwd // ""),
    (.context_window.used_percentage // 0),
    ((.context_window.current_usage // {}) | (.input_tokens // 0) + (.cache_read_input_tokens // 0)
      + (.cache_creation_input_tokens // 0) + (.output_tokens // 0)),
    (.context_window.context_window_size // 200000),
    (.rate_limits.five_hour.used_percentage // ""),
    (.rate_limits.five_hour.resets_at // ""),
    (.rate_limits.seven_day.used_percentage // ""),
    (.rate_limits.seven_day.resets_at // ""),
    (.cost.total_cost_usd // 0)
  ] | map(tostring) | join("\u001f")' <<<"$input"
)
dir=${dir/#$HOME/\~}

reset='\033[0m'; dim='\033[2m'; cyan='\033[36m'
sep=" ${dim}│${reset} "

color_for() { # green < 50%, yellow < 80%, red otherwise
  if   (( $1 < 50 )); then printf '\033[32m'
  elif (( $1 < 80 )); then printf '\033[33m'
  else                     printf '\033[31m'; fi
}

bar() { # bar <pct> <width>
  local pct=$1 width=$2 out='' i filled
  filled=$(( pct * width / 100 ))
  for (( i = 0; i < width; i++ )); do (( i < filled )) && out+='█' || out+='░'; done
  printf '%s' "$out"
}

fmt_tokens() { # 12345 -> 12.3k, 1000000 -> 1M
  awk -v n="$1" 'BEGIN{
    if (n >= 1000000) printf "%gM", n/1000000;
    else if (n >= 1000) printf "%.1fk", n/1000;
    else printf "%d", n }'
}

fmt_left() { # epoch -> time remaining, e.g. 3h12m or 4d6h
  local s=$(( $1 - $(date +%s) ))
  (( s < 0 )) && s=0
  if   (( s >= 86400 )); then printf '%dd%dh' $(( s / 86400 )) $(( s % 86400 / 3600 ))
  elif (( s >= 3600 ));  then printf '%dh%02dm' $(( s / 3600 )) $(( s % 3600 / 60 ))
  else                        printf '%dm' $(( s / 60 )); fi
}

limit() { # limit <label> <pct> <resets_at>
  [[ -z $2 ]] && return
  local p=${2%.*}
  printf "%s%s ${dim}%s${reset} %s%d%%${reset}" "$sep" "$1" "$(fmt_left "$3")" "$(color_for "$p")" "$p"
}

ctx_pct=${ctx_pct%.*}
out="${cyan}${model}${reset}${sep}${dir}${sep}"
out+="$(color_for "$ctx_pct")$(bar "$ctx_pct" 10) ${ctx_pct}%${reset} ${dim}($(fmt_tokens "$ctx_used")/$(fmt_tokens "$ctx_size"))${reset}"
out+="$(limit 5h "$five_pct" "$five_reset")"
out+="$(limit sem "$week_pct" "$week_reset")"
out+="${sep}$(printf '$%.2f' "$cost")"

printf '%b' "$out"
