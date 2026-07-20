return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")

        local ensure_installed = {
            "cpp",
            "go",
            "hcl",
            "markdown",
            "markdown_inline",
            "python",
            "xml",
            "yaml",
        }

        ts.install(ensure_installed)

        -- highlight / indent are enabled per-buffer on the main branch
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "cpp", "go", "hcl", "markdown", "python", "xml", "yaml" },
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
