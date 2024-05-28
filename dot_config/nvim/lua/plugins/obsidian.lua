local prefix = "<leader>n"
local maps = { n = {} }
maps.n[prefix] = { desc = "󰎚 Notes" }
require("astrocore").set_mappings(maps)

return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  -- the obsidian vault in this default config  ~/obsidian-vault
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/.notes/*.md" },
  cmd = {
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianFollowLink",
    "ObsidianBacklinks",
    "ObsidianTags",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTomorrow",
    "ObsidianTemplate",
    "ObsidianSearch",
    "ObsidianLink",
    "ObsidianLinkNew",
    "ObsidianWorkspace",
    "ObsidianPasteImg",
    "ObsidianRename",
  },
  keys = {
    { prefix .. "n", "<cmd>ObsidianNew<cr>", desc = "New Note (Obsidian)" },
    { prefix .. "h", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday (Obsidian)" },
    { prefix .. "j", "<cmd>ObsidianToday<cr>", desc = "Today (Obsidian)" },
    { prefix .. "l", "<cmd>ObsidianTomorrow<cr>", desc = "Tomorrow (Obsidian)" },
    { prefix .. "o", "<cmd>ObsidianQuickSwitch<cr>", desc = "QuickSwitch (Obsidian)" },
    {
      "gf",
      function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end,
      noremap = false,
      expr = true,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    use_advanced_uri = true,
    finder = "telescope.nvim",
    mappings = {},

    workspaces = {
      {
        name = "personal",
        path = "~/.notes/personal",
      },
      {
        name = "work",
        path = "~/.notes/work",
      },
    },

    -- templates = {
    --   subdir = "templates",
    --   date_format = "%Y-%m-%d-%a",
    --   time_format = "%H:%M",
    -- },

    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = vim.ui.open or require("astrocore").system_open,
  },
}
