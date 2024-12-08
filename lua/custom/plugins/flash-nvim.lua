return {
  'folke/flash.nvim',
  -- enabled = false,
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        enabled = false,
        -- jump_labels = true,
      },
      search = {
        enabled = false,
      },
    },
    label = {
      rainbow = {
        enabled = true,
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- no visual or pending operator mapping - conflicts with mini.surround
    -- for pending use '/'
    { "s", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
