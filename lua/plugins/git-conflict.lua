return {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "BufReadPre",
    opts = {
        default_mappings = true,   -- co/ct/cb/c0 と ]x/[x を有効化
        default_commands = true,   -- :GitConflict* コマンドを有効化
        disable_diagnostics = false,
        list_opener = "copen",
        highlights = {
            incoming = "DiffAdd",
            current = "DiffText",
        },
    },
}
