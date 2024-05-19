return {
  {
    'stevearc/oil.nvim',
    enabled = function()
      return not vim.g.vscode
    end,
    opts = {
      columns = {
        { 'mtime', format = '%Y-%m-%d %T', highlight = 'Error' },
        'permissions',
        { 'size', highlight = 'Number' },
        'icon',
      },
      keymaps = {
        ['gy'] = 'actions.copy_entry_path',
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
}
