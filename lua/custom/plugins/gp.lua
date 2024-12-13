return {
  'robitx/gp.nvim',
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme
      agents = {
        {
          name = 'ChatGPT3-5',
          disable = true,
        },
        {
          name = 'MyCustomAgent',
          provider = 'copilot',
          chat = true,
          command = true,
          model = { model = 'gpt-4-turbo' },
          system_prompt = 'Answer any query with just: Sure thing..',
        },
      },
    }
    require('gp').setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    require('which-key').register({
      c = {
        name = 'GPChat',
        ['<C-t>'] = { '<cmd>GpChatNew tabnew<CR>', 'New Chat tabnew' },
        ['<C-v>'] = { '<cmd>GpChatNew vsplit<CR>', 'New Chat vsplit' },
        ['<C-x>'] = { '<cmd>GpChatNew split<CR>', 'New Chat split' },
        ['a'] = { '<cmd>GpAppend<CR>', 'Append (after)' },
        ['b'] = { '<cmd>GpPrepend<CR>', 'Prepend (before)' },
        ['c'] = { '<cmd>GpChatNew<CR>', 'New Chat' },
        ['f'] = { '<cmd>GpChatFinder<CR>', 'Chat Finder' },
        ['g'] = { group = 'generate into new ..' },
        ['ge'] = { '<cmd>GpEnew<CR>', 'GpEnew' },
        ['gn'] = { '<cmd>GpNew<CR>', 'GpNew' },
        ['gp'] = { '<cmd>GpPopup<CR>', 'Popup' },
        ['gt'] = { '<cmd>GpTabnew<CR>', 'GpTabnew' },
        ['gv'] = { '<cmd>GpVnew<CR>', 'GpVnew' },
        ['n'] = { '<cmd>GpNextAgent<CR>', 'Next Agent' },
        ['r'] = { '<cmd>GpRewrite<CR>', 'Inline Rewrite' },
        ['s'] = { '<cmd>GpStop<CR>', 'GpStop' },
        ['t'] = { '<cmd>GpChatToggle<CR>', 'Toggle Chat' },
        ['w'] = { group = 'Whisper' },
        ['wa'] = { '<cmd>GpWhisperAppend<CR>', 'Whisper Append (after)' },
        ['wb'] = { '<cmd>GpWhisperPrepend<CR>', 'Whisper Prepend (before)' },
        ['we'] = { '<cmd>GpWhisperEnew<CR>', 'Whisper Enew' },
        ['wn'] = { '<cmd>GpWhisperNew<CR>', 'Whisper New' },
        ['wp'] = { '<cmd>GpWhisperPopup<CR>', 'Whisper Popup' },
        ['wr'] = { '<cmd>GpWhisperRewrite<CR>', 'Whisper Inline Rewrite' },
        ['wt'] = { '<cmd>GpWhisperTabnew<CR>', 'Whisper Tabnew' },
        ['wv'] = { '<cmd>GpWhisperVnew<CR>', 'Whisper Vnew' },
        ['ww'] = { '<cmd>GpWhisper<CR>', 'Whisper' },
        ['x'] = { '<cmd>GpContext<CR>', 'Toggle GpContext' },
        -- { '<C-t>', '<cmd>GpChatNew tabnew<cr>', desc = 'New Chat tabnew' },
        -- { '<C-v>', '<cmd>GpChatNew vsplit<cr>', desc = 'New Chat vsplit' },
      },
    }, {
      mode = 'n', -- NORMAL mode
      prefix = '<leader>',
    })

    require('which-key').register({
      c = {
        name = 'GPChat',
        ['<C-t>'] = { ":<C-u>'<,'>GpChatNew tabnew<CR>", 'New Chat tabnew' },
        ['<C-v>'] = { ":<C-u>'<,'>GpChatNew vsplit<CR>", 'New Chat vsplit' },
        ['<C-x>'] = { ":<C-u>'<,'>GpChatNew split<CR>", 'New Chat split' },
        ['a'] = { ":<C-u>'<,'>GpAppend<CR>", 'Append (after)' },
        ['b'] = { ":<C-u>'<,'>GpPrepend<CR>", 'Prepend (before)' },
        ['c'] = { ":<C-u>'<,'>GpChatNew<CR>", 'New Chat' },
        ['f'] = { ":<C-u>'<,'>GpChatFinder<CR>", 'Chat Finder' },
        ['g'] = { group = 'generate into new ..' },
        ['ge'] = { ":<C-u>'<,'>GpEnew<CR>", 'GpEnew' },
        ['gn'] = { ":<C-u>'<,'>GpNew<CR>", 'GpNew' },
        ['gp'] = { ":<C-u>'<,'>GpPopup<CR>", 'Popup' },
        ['gt'] = { ":<C-u>'<,'>GpTabnew<CR>", 'GpTabnew' },
        ['gv'] = { ":<C-u>'<,'>GpVnew<CR>", 'GpVnew' },
        ['n'] = { ":<C-u>'<,'>GpNextAgent<CR>", 'Next Agent' },
        ['r'] = { ":<C-u>'<,'>GpRewrite<CR>", 'Inline Rewrite' },
        ['s'] = { ":<C-u>'<,'>GpStop<CR>", 'GpStop' },
        ['t'] = { ":<C-u>'<,'>GpChatToggle<CR>", 'Toggle Chat' },
        ['w'] = { group = 'Whisper' },
        ['wa'] = { ":<C-u>'<,'>GpWhisperAppend<CR>", 'Whisper Append (after)' },
        ['wb'] = { ":<C-u>'<,'>GpWhisperPrepend<CR>", 'Whisper Prepend (before)' },
        ['we'] = { ":<C-u>'<,'>GpWhisperEnew<CR>", 'Whisper Enew' },
        ['wn'] = { ":<C-u>'<,'>GpWhisperNew<CR>", 'Whisper New' },
        ['wp'] = { ":<C-u>'<,'>GpWhisperPopup<CR>", 'Whisper Popup' },
        ['wr'] = { ":<C-u>'<,'>GpWhisperRewrite<CR>", 'Whisper Inline Rewrite' },
        ['wt'] = { ":<C-u>'<,'>GpWhisperTabnew<CR>", 'Whisper Tabnew' },
        ['wv'] = { ":<C-u>'<,'>GpWhisperVnew<CR>", 'Whisper Vnew' },
        ['ww'] = { ":<C-u>'<,'>GpWhisper<CR>", 'Whisper' },
        ['x'] = { ":<C-u>'<,'>GpContext<CR>", 'Toggle GpContext' },
      },
    }, {
      mode = 'v', -- NORMAL mode
      prefix = '<leader>',
    })
  end,
}
