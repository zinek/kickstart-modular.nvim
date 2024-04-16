return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    main = "harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        menu = {
            width = vim.api.nvim_win_get_width(0) - 32,
        }
    },
    config = function()
        local harpoon = require("harpoon")
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", '<M-">', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<M-S-f>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<M-S-d>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<M-S-s>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<M-S-a>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<M-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<M-S-N>", function() harpoon:list():next() end)
    end
}
