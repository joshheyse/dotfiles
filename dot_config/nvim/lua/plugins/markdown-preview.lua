return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_open_to_the_world = 1
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_echo_preview_url = 1
  end,
}
