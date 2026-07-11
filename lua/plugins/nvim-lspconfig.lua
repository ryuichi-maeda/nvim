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
		local servers = opts.servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local function on_attach(_, bufnr)
			local options = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options)
		end

		-- Defaults applied to every server (Neovim 0.11+ vim.lsp.config API)
		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		for server, server_opts in pairs(servers) do
			if type(server_opts) == "table" and not vim.tbl_isempty(server_opts) then
				vim.lsp.config(server, server_opts)
			end
			vim.lsp.enable(server)
		end
	end,
}
