# Guaynora.Dots

Configuración de mi escritorio en **Arch Linux + Hyprland**, con tema **Catppuccin Mocha** en todo.

| Paquete | Qué contiene |
|---|---|
| `hypr` | Hyprland (config en Lua), hyprlock, hypridle, hyprpaper |
| `waybar` | Barra flotante solo con iconos |
| `wofi` | Lanzador de apps y menús |
| `dunst` | Notificaciones |
| `kitty` | Terminal (transparente, JetBrainsMono Nerd Font) |
| `zsh` | `.zshrc` / `.zshenv`: autosugerencias, resaltado, fzf, zoxide, starship |
| `tmux` | Prefijo por defecto (`Ctrl+b`), ratón, divisiones con `\|` y `-` |
| `nvim` | LazyVim |
| `lazygit` | Tema Catppuccin + diffs con delta |
| `scripts` | Scripts en `~/.local/bin` (menú de apagado, módulos de Waybar, actualizar) |

## Instalación

Se usa [GNU Stow](https://www.gnu.org/software/stow/) para crear los enlaces simbólicos.

```sh
git clone https://github.com/Guaynora/Guaynora.Dots ~/.dotfiles
cd ~/.dotfiles
stow hypr waybar wofi dunst kitty zsh tmux nvim lazygit scripts
```

### Paquetes necesarios

```sh
sudo pacman -S hyprland hyprpaper hyprlock hypridle hyprpolkitagent xdg-desktop-portal-hyprland \
  xdg-desktop-portal-gtk waybar wofi dunst kitty zsh tmux neovim lazygit git-delta starship \
  fzf zoxide eza bat fd ripgrep btop grim slurp wl-clipboard cliphist pavucontrol playerctl \
  network-manager-applet pacman-contrib ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji \
  zsh-autosuggestions zsh-syntax-highlighting zsh-completions stow
```

## Atajos principales

| Atajo | Acción |
|---|---|
| `SUPER + Q` | Terminal |
| `SUPER + C` | Cerrar ventana |
| `SUPER + R` | Lanzador de apps |
| `SUPER + B` | Firefox |
| `SUPER + E` | Archivos |
| `SUPER + L` | Bloquear pantalla |
| `SUPER + Escape` | Menú de apagado |
| `SUPER + SPACE` | Cambiar teclado us / es |
| `SUPER + SHIFT + V` | Historial del portapapeles |
| `SUPER + SHIFT + P` | Captura de una zona (se guarda en `~/Pictures`) |
| `SUPER + CTRL + P` | Captura de pantalla completa |
| `SUPER + SHIFT + G` | lazygit flotante |
| `SUPER + SHIFT + T` | btop flotante |
| `SUPER + 1…0` | Ir al escritorio |
| `SUPER + SHIFT + 1…0` | Mover ventana al escritorio |

El fondo de pantalla no está en el repo: va en `~/Pictures/wallpapers/` (ver `hyprpaper.conf`).
