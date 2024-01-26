return {
  "karb94/neoscroll.nvim",
  lazy = false,
  config = function ()
    require('neoscroll').setup {
      easing_function = "quadratic",
      hide_cursor = true,          -- Hide cursor while scrolling
      pre_hook = function() vim.wo.cursorline = false end,
      post_hook = function() vim.wo.cursorline = true end
    }

    local t = {}
    -- Syntax: t[keys] = {function, {function arguments}}
    t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
    t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}}
    t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '200'}}
    t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '200'}}
    t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
    t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
    t['zt']    = {'zt', {'150'}}
    t['zz']    = {'zz', {'150'}}
    t['zb']    = {'zb', {'150'}}
    -- t['gg']    = {'gg', {'50'}}
    -- t['G']     = {'G',  {'50'}}

    require('neoscroll.config').set_mappings(t)
      end
}

