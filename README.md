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
| `claude` | Claude Code settings and status line (context usage, 5h and weekly limits, session cost) |

## Installation

[GNU Stow](https://www.gnu.org/software/stow/) is used to create the symlinks.

```sh
git clone https://github.com/Guaynora/Guaynora.Dots ~/.dotfiles
cd ~/.dotfiles
stow hypr waybar wofi dunst kitty zsh tmux nvim lazygit scripts starship fastfetch btop yazi theme claude
```

### Manual steps

Some pieces can't live in the repo:

```sh
# yazi flavor (ignored by git)
ya pkg install

# libadwaita (GTK4) apps ignore the GTK theme name, so link the theme's CSS
theme=/usr/share/themes/catppuccin-mocha-blue-standard+default/gtk-4.0
for f in gtk.css gtk-dark.css assets; do ln -sfn "$theme/$f" ~/.config/gtk-4.0/$f; done

# hyprpaper reads the current wallpaper through this symlink (SUPER+SHIFT+W changes it)
mkdir -p ~/.local/state/wallpaper
ln -sfn ~/Pictures/wallpapers/<image> ~/.local/state/wallpaper/current
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

`SUPER + K` lists every bind that has a `description` in `hyprland.lua`.

| Binding | Action |
|---|---|
| `SUPER + Q` | Terminal |
| `SUPER + C` | Close window |
| `SUPER + SPACE` | App launcher |
| `SUPER + K` | Keybindings help (searchable) |
| `SUPER + V` | Toggle floating |
| `SUPER + B` | Firefox (focuses it if already open) |
| `SUPER + E` | File manager (focuses it if already open) |
| `SUPER + L` | Lock screen |
| `SUPER + Escape` | Power menu |
| `SUPER + ALT + SPACE` | Switch keyboard layout (us / es) |
| `SUPER + SHIFT + V` | Clipboard history |
| `SUPER + SHIFT + P` | Screenshot of a region (saved to `~/Pictures`) |
| `SUPER + CTRL + P` | Full-screen screenshot |
| `SUPER + SHIFT + G` | Floating lazygit (focuses it if already open) |
| `SUPER + SHIFT + T` | Floating btop (focuses it if already open) |
| `SUPER + SHIFT + E` | Floating yazi |
| `SUPER + SHIFT + W` | Wallpaper picker (`~/Pictures/wallpapers`) |
| `SUPER + 1…0` | Go to workspace |
| `SUPER + SHIFT + 1…0` | Move window to workspace |

The wallpaper is not included in the repo: put your images in `~/Pictures/wallpapers/`.

## Login screen (SDDM)

[sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme) with my wallpaper and Catppuccin colors.
These are system files, so they are copied instead of stowed:

```sh
sudo pacman -S --needed sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg
sudo git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
sudo mkdir -p /etc/sddm.conf.d /usr/share/backgrounds
printf '[Theme]\nCurrent=sddm-astronaut-theme\n' | sudo tee /etc/sddm.conf.d/theme.conf
sudo install -m644 ~/Pictures/wallpapers/ada-wong-resident-evil-cj-3440x1440.jpg /usr/share/backgrounds/ada-wong-3440x1440.jpg
sudo install -m644 system/sddm/astronaut.conf.user /usr/share/sddm/themes/sddm-astronaut-theme/Themes/astronaut.conf.user
```

The overrides live in `astronaut.conf.user`, which theme updates (`git pull`) don't touch.
SDDM can't read `~` (it runs as its own user), so the wallpaper is copied to `/usr/share/backgrounds`.
