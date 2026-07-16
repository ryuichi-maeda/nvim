return {
	"dhruvasagar/vim-table-mode",
	ft = { "markdown" },
	cmd = { "TableModeToggle", "TableModeEnable", "Tableize" },
	init = function()
		-- Use GitHub-flavored markdown corner style (| instead of default +)
		vim.g.table_mode_corner = "|"
	end,
}
