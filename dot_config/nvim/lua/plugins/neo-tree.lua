return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Location = "" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>r"
        maps.n[prefix] = {
          desc = require("astroui").get_icon("Location", 1, true) .. "Reveal",
          "<cmd>Neotree reveal<cr>",
        }
      end,
    },
  },
  opts = {
    use_popups_for_input = true,
    popup_border_style = "double",
    window = {
      width = 30,
      mappings = {
        v = "open_vsplit",
        s = "open_split",
        m = {
          "move",
          config = {
            show_path = "relative",
          },
        },
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = false,
      },
    },
  },
}
