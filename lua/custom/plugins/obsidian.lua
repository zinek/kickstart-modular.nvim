return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    'BufReadPre ' .. '**/vaults/**/*.md',
    'BufNewFile ' .. '**/vaults/**/*.md',
  },
  keys = {
    {
      '<leader>oc',
      function()
        require('telescope.builtin').commands { default_text = 'obsidian' }
      end,
      mode = '',
      desc = '[O]bsidian [C]ommand',
    },
    {
      '<leader>ot',
      '<cmd>ObsidianToday<CR>',
      mode = '',
      desc = '[O]bsidian [T]oday',
    },
    {
      '<leader>od',
      '<cmd>ObsidianDailies<CR>',
      mode = '',
      desc = '[O]bsidian [D]ailies',
    },
    {
      '<leader>oo',
      '<cmd>ObsidianOpen<CR>',
      mode = '',
      desc = '[O]bsidian [O]pen',
    },
    {
      '<leader>ow',
      '<cmd>ObsidianWorkspace<CR>',
      mode = '',
      desc = '[O]bsidian [W]orkspace',
    },
    {
      '<leader>os',
      '<cmd>ObsidianQuickSwitch<CR>',
      mode = '',
      desc = '[O]bsidian [S]earch',
    },
    {
      '<leader>og',
      '<cmd>ObsidianSearch<CR>',
      mode = '',
      desc = '[O]bsidian [G]rep',
    },
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/vaults/personal',
      },
      {
        name = 'work',
        path = '~/vaults/work',
      },
    },

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = 'dailies',
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = '%Y-%m-%d',
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = '%B %-d, %Y',
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil,
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    -- see below for full list of options 👇
  },
  -- config = function(_, opts)
  --   require('obsidian').setup(opts)
  --   vim.keymap.set('n', '<leader>oc', function()
  --     require('telescope.builtin').commands { default_text = 'obsidian' }
  --   end, { desc = 'Obsidian command' })
  -- end,
}
