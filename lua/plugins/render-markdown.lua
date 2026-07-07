return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = {
		"markdown",
	},
	cmd = {
		"RenderMarkdown",
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		bullet = {
			-- Default `ordered_icons` crashes ("attempt to compare number with nil")
			-- when an ordered list marker is momentarily parsed as empty/partial text
			-- during incremental re-parsing (async vim.schedule render while scrolling
			-- or editing). Guard against tonumber returning nil by falling back to
			-- ctx.index. See render-markdown settings.lua:161-165.
			ordered_icons = function(ctx)
				local value = vim.trim(ctx.value)
				local index = tonumber(value:sub(1, #value - 1)) or ctx.index
				return ("%d."):format(index > 1 and index or ctx.index)
			end,
		},
	},
}
