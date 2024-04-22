return {
  'github/copilot.vim',
  init = function()
    vim.keymap.set('i', '<M-CR>', 'copilot#Accept("")', {
      expr = true,
      replace_keycodes = false,
    })
    vim.g.copilot_no_tab_map = true
  end,
}
