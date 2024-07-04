return {
  'diepm/vim-rest-console',
  ft = 'rest',
  init = function()
    -- vim.g.vrc_set_default_mapping = 0
    vim.g.vrc_response_default_content_type = 'application/json'
    vim.g.vrc_output_buffer_name = '_OUTPUT_.json'
    vim.g.vrc_auto_format_response_enabled = 1
    vim.g.vrc_auto_format_response_patterns = {
      json = 'jq',
    }
    -- vim.g.vrc_curl_opts = {
    --   ['--silent'] = '',
    --   ['--insecure'] = '',
    --   ['-i'] = '',
    -- }
  end,
}
