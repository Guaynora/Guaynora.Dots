-- Catppuccin Mocha (matches kitty, waybar, etc.) with a transparent background
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true, -- lets kitty's transparency and blur show through
      float = { transparent = true, solid = false },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
}
