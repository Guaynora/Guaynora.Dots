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
| `starship` | Catppuccin powerline prompt |
| `fastfetch` | System info greeting on new kitty windows |
| `btop` | Catppuccin theme, transparent background |
| `yazi` | Terminal file manager with the Catppuccin flavor |
| `theme` | GTK, Qt (qt6ct + Kvantum), KDE color scheme, Papirus icons and Catppuccin cursor |

## Installation

[GNU Stow](https://www.gnu.org/software/stow/) is used to create the symlinks.

```sh
git clone https://github.com/Guaynora/Guaynora.Dots ~/.dotfiles
cd ~/.dotfiles
stow hypr waybar wofi dunst kitty zsh tmux nvim lazygit scripts starship fastfetch btop yazi theme
```

### Manual steps

Some pieces can't live in the repo:

```sh
# yazi flavor (ignored by git)
ya pkg install

# libadwaita (GTK4) apps ignore the GTK theme name, so link the theme's CSS
theme=/usr/share/themes/catppuccin-mocha-blue-standard+default/gtk-4.0
for f in gtk.css gtk-dark.css assets; do ln -sfn "$theme/$f" ~/.config/gtk-4.0/$f; done
```

KDE apps keep their own color scheme. In Dolphin, pick **Catppuccin Mocha** from the
menu (Configure → Window Color Scheme); otherwise file names render dark on dark.

### Required packages

```sh
sudo pacman -S hyprland hyprpaper hyprlock hypridle hyprpolkitagent xdg-desktop-portal-hyprland \
  xdg-desktop-portal-gtk waybar wofi dunst kitty zsh tmux neovim lazygit git-delta starship \
  fzf zoxide eza bat fd ripgrep btop grim slurp wl-clipboard cliphist pavucontrol playerctl \
  network-manager-applet pacman-contrib ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji \
  zsh-autosuggestions zsh-syntax-highlighting zsh-completions stow fastfetch yazi 7zip jq \
  poppler imagemagick resvg qt6ct kvantum papirus-icon-theme dolphin ffmpegthumbs \
  kdegraphics-thumbnailers archlinux-xdg-menu

yay -S catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git \
  kvantum-theme-catppuccin-git
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
| `SUPER + SHIFT + E` | Floating yazi |
| `SUPER + 1…0` | Go to workspace |
| `SUPER + SHIFT + 1…0` | Move window to workspace |

The wallpaper is not included in the repo: put it in `~/Pictures/wallpapers/` (see `hyprpaper.conf`).
