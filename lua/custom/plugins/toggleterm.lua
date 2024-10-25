return {
  'akinsho/toggleterm.nvim',
  -- event = "VeryLazy",
  cmd = 'ToggleTerm',
  keys = {

    { '<M-$>', '<cmd>:ToggleTerm<CR>', mode = { 'n', 't' } },
    { '<M-!>', '<cmd>:1ToggleTerm<CR>', mode = { 'n', 't' } },
    { '<M-@>', '<cmd>:2ToggleTerm<CR>', mode = { 'n', 't' } },
    { '<M-#>', '<cmd>:3ToggleTerm<CR>', mode = { 'n', 't' } },
    { '<M-%>', '<cmd>:TermSelect<CR>', mode = { 'n', 't' } },
    { '<leader>gl', '', mode = { 'n', 't' } },
    { '<leader>gl', function() end, mode = { 'n', 't' } },
  },
  version = '*',
  config = function()
    require('toggleterm').setup {

      start_in_insert = true,
      terminal_mappings = true,
      direction = 'float',
      -- shell = "pwsh.exe -NoLogo -NoProfile",
      -- shell = 'pwsh.exe -NoLogo',
      auto_scroll = true,
      persist_mode = true,
      persist_size = true,
      close_on_exit = true,
    }

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set({ 'n', 't' }, '<leader>gg', function()
      _lazygit_toggle()
    end)
  end,
}
