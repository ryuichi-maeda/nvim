return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "cpp",
            "go",
            "python",
            "xml",
            "yaml",
        },
        sync_install = false,
        highlight = {
            enable = true,
            disable = {},
        },
        indent = {
            enable = true,
        },
    },
}

