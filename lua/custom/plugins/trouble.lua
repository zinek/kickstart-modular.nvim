return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  init = function()
    local trouble = require 'trouble'

    vim.keymap.set('n', '[T', function()
      trouble.first { skip_groups = true, jump = true }
    end, {})
    vim.keymap.set('n', '[t', function()
      trouble.previous { skip_groups = true, jump = true }
    end, {})
    vim.keymap.set('n', ']t', function()
      trouble.next { skip_groups = true, jump = true }
    end, {})
    vim.keymap.set('n', ']T', function()
      trouble.last { skip_groups = true, jump = true }
    end, {})

    vim.keymap.set('n', '<leader>xx', function()
      require('trouble').open()
    end)
    vim.keymap.set('n', '<leader>xc', function()
      require('trouble').close()
    end)
    vim.keymap.set('n', '<leader>xw', function()
      require('trouble').open 'workspace_diagnostics'
    end)
    vim.keymap.set('n', '<leader>xd', function()
      require('trouble').open 'document_diagnostics'
    end)
    vim.keymap.set('n', '<leader>xq', function()
      require('trouble').open 'quickfix'
    end)
    vim.keymap.set('n', '<leader>xl', function()
      require('trouble').open 'loclist'
    end)
    vim.keymap.set('n', '<leader>xr', function()
      require('trouble').open 'lsp_references'
    end)
  end,
}
