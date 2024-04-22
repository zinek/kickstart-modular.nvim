local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
local make_entry = require 'telescope.make_entry'
local utils = require 'telescope.utils'

local git_command = utils.__git_command
local get_git_command_output = function(args, opts)
  return utils.get_os_command_output(git_command(args, opts), opts.cwd)
end

local function getBranchName(s)
  local temp = s:match '^[%s*]*(.-)%s*$'
  return temp:gsub('#', '\\\\#')
end

local findBranch = function(opts, callback)
  -- vim.fn.system({ "git", "fetch" })
  local p = pickers.new(opts, {
    finder = finders.new_oneshot_job({ 'git', 'branch', '--all' }, opts),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()[1]
        callback(selection)
      end)
      return true
    end,
  })

  p:find()
end

function BranchSwitch()
  findBranch(
    require('telescope.themes').get_dropdown {
      prompt_title = 'switch branch',
    },
    function(selectedBranch)
      local branch = getBranchName(selectedBranch):gsub('^remotes/origin/', '')
      -- local a = vim.fn.system({ "git", "switch", branch})
      -- vim.api.nvim_put({ a }, "", false, true)
      vim.cmd('!git switch ' .. branch)
      -- print(a)

      -- local to_display = tostring(vim.v.shell_error);
      -- vim.cmd("echo " .. to_display)
      -- vim.api.nvim_put({ to_display }, "", false, true)
    end
  )
end

function BranchDiff()
  findBranch(
    require('telescope.themes').get_dropdown {
      prompt_title = 'diff against branch',
    },
    function(selectedBranch)
      local branch = getBranchName(selectedBranch):gsub('^remotes/', '')
      local base = vim.fn.system { 'git', 'merge-base', branch, 'HEAD' }
      vim.cmd('G diff ' .. base)
    end
  )
end

vim.api.nvim_set_keymap('n', '<leader>bd', '<cmd>lua BranchDiff()<CR>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap('n', '<leader>bs', '<cmd>lua BranchSwitch()<CR>', { noremap = false, nowait = true })
