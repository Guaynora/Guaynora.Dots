-- Tema Catppuccin Mocha (a juego con kitty, waybar, etc.) con fondo transparente
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true, -- deja ver la transparencia y el blur de kitty
      float = { transparent = true, solid = false },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
}
