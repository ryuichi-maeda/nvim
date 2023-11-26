require("tokyonight").setup({
    style = "Moon",
    transparent = false,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "dark",
        floats = "dark",
    },
    sidebars = { "qf", "help" },
    hide_interactive_statusline = false,
})

