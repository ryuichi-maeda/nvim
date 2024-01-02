return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		servers = {
			ccls = {},
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
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			local options = { noremap = true, silent = true }
			buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<Return>", options)
			buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<Return>", options)
			buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<Return>", options)
		end

		local function setup(server)
			local server_opts = {
				on_attach = on_attach,
				capabilities = capabilities,
			}
			require("lspconfig")[server].setup(server_opts)
		end

		for server, _ in pairs(servers) do
			setup(server)
		end
	end,
}
