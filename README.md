# Guaynora.Dots

My desktop setup on **Arch Linux + Hyprland**, themed with **Catppuccin Mocha** throughout.

| Package | Contents |
|---|---|
| `hypr` | Hyprland (Lua config), hyprlock, hypridle, hyprpaper |
| `waybar` | Floating, icon-only bar |
| `wofi` | App launcher and menus |
| `dunst` | Notifications |
| `kitty` | Terminal (translucent, JetBrainsMono Nerd Font) |
| `zsh` | `.zshrc` / `.zshenv`: autosuggestions, syntax highlighting, fzf, zoxide, starship |
| `tmux` | Default prefix (`Ctrl+b`), mouse support, `\|` and `-` splits |
| `nvim` | LazyVim |
| `lazygit` | Catppuccin theme + diffs with delta |
| `scripts` | Scripts in `~/.local/bin` (power menu, Waybar modules, system update) |

## Installation

[GNU Stow](https://www.gnu.org/software/stow/) is used to create the symlinks.

```sh
git clone https://github.com/Guaynora/Guaynora.Dots ~/.dotfiles
cd ~/.dotfiles
stow hypr waybar wofi dunst kitty zsh tmux nvim lazygit scripts
```

### Required packages

```sh
sudo pacman -S hyprland hyprpaper hyprlock hypridle hyprpolkitagent xdg-desktop-portal-hyprland \
  xdg-desktop-portal-gtk waybar wofi dunst kitty zsh tmux neovim lazygit git-delta starship \
  fzf zoxide eza bat fd ripgrep btop grim slurp wl-clipboard cliphist pavucontrol playerctl \
  network-manager-applet pacman-contrib ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji \
  zsh-autosuggestions zsh-syntax-highlighting zsh-completions stow
```

## Key bindings

| Binding | Action |
|---|---|
| `SUPER + Q` | Terminal |
| `SUPER + C` | Close window |
| `SUPER + R` | App launcher |
| `SUPER + B` | Firefox |
| `SUPER + E` | File manager |
| `SUPER + L` | Lock screen |
| `SUPER + Escape` | Power menu |
| `SUPER + SPACE` | Switch keyboard layout (us / es) |
| `SUPER + SHIFT + V` | Clipboard history |
| `SUPER + SHIFT + P` | Screenshot of a region (saved to `~/Pictures`) |
| `SUPER + CTRL + P` | Full-screen screenshot |
| `SUPER + SHIFT + G` | Floating lazygit |
| `SUPER + SHIFT + T` | Floating btop |
| `SUPER + 1…0` | Go to workspace |
| `SUPER + SHIFT + 1…0` | Move window to workspace |

The wallpaper is not included in the repo: put it in `~/Pictures/wallpapers/` (see `hyprpaper.conf`).
