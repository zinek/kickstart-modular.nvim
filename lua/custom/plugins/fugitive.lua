return {
  'tpope/vim-fugitive',
  event = 'BufWinEnter',
  config = function()
    vim.keymap.set('n', '<leader>g', ':G', { desc = '[G]it' })
    vim.keymap.set('n', '<leader>gs', ':G<CR>', { desc = '[G]it [S]tatus' })
    vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = '[G]it [B]lame' })
    vim.keymap.set('n', '<leader>ge', ':Gedit ', { desc = '[G]it [E]dit' })
    vim.keymap.set('n', '<leader>gd', ':Gdiff ', { desc = '[G]it [D]iff' })
    vim.keymap.set('n', '<leader>gl', ':0Gclog<CR>', { desc = '[G]it [L]og current file' })

    vim.keymap.set('v', '<leader>gl', ':Gclog<CR>', { desc = '[G]it [L]og selection' })
    vim.keymap.set('v', '<leader>gp', "y:Gclog -S'<C-R>\"'", { desc = '[G]it [P]ickaxe selection' })

    vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { desc = 'Lazy Git' })
  end,
}
