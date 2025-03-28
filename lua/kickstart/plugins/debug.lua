-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap = require 'dap'
    local widgets = require 'dap.ui.widgets'
    local dapui = require 'dapui'

    local function is_windows()
      -- Use os_uname().sysname for checking the OS type
      local os_name = vim.loop.os_uname().sysname
      return os_name:match 'Windows_NT' ~= nil
    end

    local pathSeparator = package.config:sub(1, 1) -- Get the OS-specific path separator
    local function normalize_path(path)
      if pathSeparator == '\\' then
        return path:gsub('/', '\\')
      else
        return path
      end
    end

    require('nvim-dap-virtual-text').setup {}

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<S-F5>', dap.terminate, { desc = 'Debug: Stop' })
    vim.keymap.set('n', '<F1>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F2>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })
    vim.keymap.set('v', '<M-K>', dapui.eval, { desc = 'Debug: eval' })
    vim.keymap.set('n', '<M-K>', dapui.eval, { desc = 'Debug: eval' })
    vim.keymap.set('n', '<F8>', function()
      dapui.float_element 'watches'
    end, { desc = 'Debug: open watches window' })
    vim.keymap.set('n', '<F9>', function()
      dapui.float_element()
    end, { desc = 'Debug: open window' })

    vim.api.nvim_set_hl(0, 'blue', { fg = '#3d59a1' })
    vim.api.nvim_set_hl(0, 'red', { fg = '#ff0000' })
    vim.api.nvim_set_hl(0, 'green', { fg = '#9ece6a' })
    vim.api.nvim_set_hl(0, 'yellow', { fg = '#FFFF00' })
    vim.api.nvim_set_hl(0, 'orange', { fg = '#f09000' })
    -- vim.cmd [[
    --   autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>
    -- ]]

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'red', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '󰋗', texthl = 'red', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'orange', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'green', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'yellow', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    -- dapui.setup()
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        element = 'repl',
        enabled = true,
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      mappings = {},
      element_mappings = {},
      expand_lines = true,
      force_buffers = true,
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- local mason_path = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/')
    local netcoredbg = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/' .. 'packages/netcoredbg/netcoredbg')
    if is_windows() then
      netcoredbg = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/' .. 'packages/netcoredbg/netcoredbg/netcoredbg.exe')
    end
    print('netcoredbg path', netcoredbg)
    dap.adapters.coreclr = {
      type = 'executable',
      command = netcoredbg,
      args = { '--interpreter=vscode' },
    }
    dap.configurations.cs = {
      {
        type = 'coreclr',
        name = 'launch - netcoredbg',
        request = 'launch',
        -- program = function()
        --   -- return 'aaa'
        --   return '/home/marcin/git/zinek/aoc/bin/Debug/net8.0/aoc.dll'
        --   -- return vim.fn.input { 'Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file' }
        -- end,
        program = function()
          -- local path = vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/**/*.dll', 'file')
          local path = require('dap.utils').pick_file {
            filter = '.*%.dll',
            executables = false,
            path = vim.fn.glob(vim.fn.getcwd() .. '/bin'),
          }
          return (path and path ~= '') and path or dap.ABORT
        end,
        cwd = function()
          -- todo: request input from ui
          return vim.fn.getcwd()
        end,
      },
    }

    -- Install golang specific config
    require('dap-go').setup()
  end,
}
