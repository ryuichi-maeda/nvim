return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		servers = {
			ccls = {},
			terraformls = {},
			yamlls = {},
			pyright = {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			-- You can add other servers
		},
	},
	config = function(_, opts)
		-- Show diagnostics inline (virtual text) and sort by severity
		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
		})

		local servers = opts.servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- Use LspAttach instead of on_attach: server configs that define their own
		-- on_attach (e.g. lspconfig's pyright) override the one set via "*"
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local options = { noremap = true, silent = true, buffer = args.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options)
			end,
		})

		-- Defaults applied to every server (Neovim 0.11+ vim.lsp.config API)
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		for server, server_opts in pairs(servers) do
			if type(server_opts) == "table" and not vim.tbl_isempty(server_opts) then
				vim.lsp.config(server, server_opts)
			end
			vim.lsp.enable(server)
		end
	end,
}
