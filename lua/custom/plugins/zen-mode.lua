return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      width = 130,
      options = {
        number = true,
      },
    },
  },
  init = function()
    vim.keymap.set('n', '<leader>zz', function()
      require('zen-mode').toggle()
    end)
  end,
}
