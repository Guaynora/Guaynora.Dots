# ~/.zshrc

# ---------- History ----------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# ---------- Options ----------
setopt AUTO_CD            # typing a directory name cds into it
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

# ---------- Completion ----------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                          # arrow-navigable menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ---------- Keys ----------
bindkey -e                                   # emacs style (like bash)
bindkey '^[[1;5C' forward-word               # Ctrl + →
bindkey '^[[1;5D' backward-word              # Ctrl + ←
bindkey '^[[H' beginning-of-line             # Home
bindkey '^[[F' end-of-line                   # End
bindkey '^[[3~' delete-char                  # Delete
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search   # ↑ searches history for what you already typed
bindkey '^[[B' down-line-or-beginning-search # ↓

# ---------- Aliases ----------
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# ---------- Modern tools (only if installed) ----------
if command -v eza >/dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -lah --icons --group-directories-first --git'
  alias lt='eza --tree --level=2 --icons'
fi
command -v bat     >/dev/null && alias cat='bat --paging=never --style=plain'
command -v lazygit >/dev/null && alias lg='lazygit'
command -v btop    >/dev/null && alias top='btop'
command -v zoxide  >/dev/null && eval "$(zoxide init zsh --cmd cd)"   # cd learns your folders: "cd proj" jumps to ~/Projects

# ---------- fzf (Ctrl+R history, Ctrl+T files, Alt+C folders) ----------
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# ---------- Plugins ----------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # must be last

# ---------- Prompt ----------
eval "$(starship init zsh)"
