return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = {
            { "<leader>f", group = "Telescope" },
            { "<leader>n", group = "Neo-tree" },
            { "<leader>t", group = "Gitsigns toggle" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = true })
            end,
            desc = "Show all keymaps",
        },
    },
}
