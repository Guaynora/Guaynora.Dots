# ~/.zshrc

# ---------- Historial ----------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# ---------- Opciones ----------
setopt AUTO_CD            # escribir un directorio = cd a él
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

# ---------- Autocompletado ----------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                          # menú navegable con flechas
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # sin distinguir mayúsculas
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ---------- Teclas ----------
bindkey -e                                   # estilo emacs (como bash)
bindkey '^[[1;5C' forward-word               # Ctrl + →
bindkey '^[[1;5D' backward-word              # Ctrl + ←
bindkey '^[[H' beginning-of-line             # Inicio
bindkey '^[[F' end-of-line                   # Fin
bindkey '^[[3~' delete-char                  # Supr
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search   # ↑ busca en historial lo que ya escribiste
bindkey '^[[B' down-line-or-beginning-search # ↓

# ---------- Alias ----------
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# ---------- Herramientas modernas (solo si están instaladas) ----------
if command -v eza >/dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -lah --icons --group-directories-first --git'
  alias lt='eza --tree --level=2 --icons'
fi
command -v bat     >/dev/null && alias cat='bat --paging=never --style=plain'
command -v lazygit >/dev/null && alias lg='lazygit'
command -v btop    >/dev/null && alias top='btop'
command -v zoxide  >/dev/null && eval "$(zoxide init zsh --cmd cd)"   # cd aprende tus carpetas: "cd proj" salta a ~/Projects

# ---------- fzf (Ctrl+R historial, Ctrl+T archivos, Alt+C carpetas) ----------
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# ---------- Plugins ----------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # debe ir al final

# ---------- Prompt ----------
eval "$(starship init zsh)"
