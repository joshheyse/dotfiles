return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  keys = {
    {
      "<Leader>uD",
      function()
        local show_lines = require("lsp_lines").toggle()
        vim.diagnostic.config {
          virtual_text = not show_lines,
          virtual_lines = { only_current_line = show_lines }
        }
      end,
      desc = "Toggle virtual diagnostic lines",
    },
  },
  opts = {},
  config = function(_, opts)
    -- disable diagnostic virtual text
    local lsp_utils = require "astronvim.utils.lsp"
    lsp_utils.diagnostics[3].virtual_text = false
     lsp_utils.diagnostics[3].virtual_lines = { only_current_line = true }
    vim.diagnostic.config(lsp_utils.diagnostics[vim.g.diagnostics_mode])
    require("lsp_lines").setup(opts)
  end,
}
