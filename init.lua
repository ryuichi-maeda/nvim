require("options")
if vim.g.vscode then
	require("keymaps-vscode")
else
	require("autocmds")
	require("indent")
	require("keymaps")
	require("keymaps-terminal")
	require("lazynvim")
end
