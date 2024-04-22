return {
  'diepm/vim-rest-console',
  ft = 'rest',
  init = function()
    -- vim.g.vrc_set_default_mapping = 0
    vim.g.vrc_response_default_content_type = 'application/json'
    vim.g.vrc_output_buffer_name = '_OUTPUT_.json'
    vim.g.vrc_aut_format_response_patters = {
      json = 'jq',
    }
  end,
}
