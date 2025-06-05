if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "vim",
      "vimdoc",
      "luap",
      "cmake",
      "cpp",
      "objc",
      "cuda",
      "proto",
      "yaml",
      "dockerfile",
      "helm",
      "json",
      "jsonc",
      "toml",
      "rust",
      "terraform",
      "html",
      "css",
      "scss",
      "javascript",
      "typescript",
      "tsx",
      "jsdoc",
      "regex",
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
