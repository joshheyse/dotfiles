return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    transparent = true,
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim                                                                                                  |
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value `:help attr-list`
      comments = "italic",
      keywords = "bold",
      functions = "NONE",
      variables = "NONE",
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "transparent",       -- style for sidebars, see below
    },
    day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors                                                  |
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**. |
    dim_inactive = true,              -- dims inactive windows
    lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold|
    on_highlights = function(hl, _)
      hl.TSRainbowRed = { link = "rainbowcol1" }
      hl.TSRainbowOrange = { link = "rainbowcol2" }
      hl.TSRainbowGreen = { link = "rainbowcol3" }
      hl.TSRainbowCyan = { link = "rainbowcol4" }
      hl.TSRainbowBlue = { link = "rainbowcol5" }
      hl.TSRainbowViolet = { link = "rainbowcol6" }
      hl.TSRainbowYellow = { link = "rainbowcol7" }
    end,
  },
  config = function(_, opts)
    local tokyonight = require("tokyonight")
    tokyonight.setup(opts)
    tokyonight.load()
  end,
}

