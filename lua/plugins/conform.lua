return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			terraform = { "terraform_fmt" },
			["terraform-vars"] = { "terraform_fmt" },
			yaml = { "yamlfmt" },
		},
		formatters = {
			yamlfmt = {
				args = { "-formatter", "retain_line_breaks=true", "-" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
