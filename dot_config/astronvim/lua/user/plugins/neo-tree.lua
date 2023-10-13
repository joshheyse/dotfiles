return {
  "nvim-neo-tree/neo-tree.nvim",
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
  },
}
