local opts = { noremap = true }

local keymap = vim.api.nvim_set_keymap

-- Helper function to wrap VSCode actions
local function vscode_action(api)
	return "<Cmd>lua require('vscode-neovim').action('" .. api .. "')<CR>"
end
local function vscode_call(api)
	return "<Cmd>lua require('vscode-neovim').call('" .. api .. "')<CR>"
end

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Normal --
-- Close editor
keymap("n", "<leader>w", vscode_action("workbench.action.closeActiveEditor"), opts)

-- Swhich window (editor group)
-- keymap("n", "<C-h>", vscode_call("diffEditor.switchSide"), opts)

-- Move to file explorer
keymap("n", "<leader>e", vscode_action("workbench.files.action.focusFilesExplorer"), opts)

-- Split window
-- keymap("n", "s", "<Nop>", opts)
-- keymap("n", "ss", vscode_action("explorer.openToSide"), opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Move to edge
keymap("n", "<leader>h", "^", opts)
keymap("n", "<leader>l", "$", opts)

-- Add blank line
keymap("n", "<leader>j", "o<ESC>", opts)
keymap("n", "<leader>k", "<S-o><ESC>", opts)

-- Replace
keymap("n", "<leader><S-s>", ":%s/", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- No hlsearch
keymap("n", "<Esc><Esc>", ":nohlsearch<Return>", opts)

-- Grep
keymap("n", "gw", "*", opts)

-- File search
keymap("n", "<leader>ff", vscode_action("workbench.action.quickOpen"), opts)

-- Word search
keymap("n", "<leader>fg", vscode_call("filesExplorer.findInWorkspace"), opts)
