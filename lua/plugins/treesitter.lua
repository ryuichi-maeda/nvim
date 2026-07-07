return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = {
                "cpp",
                "go",
                "markdown",
                "markdown_inline",
                "python",
                "xml",
                "yaml",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
