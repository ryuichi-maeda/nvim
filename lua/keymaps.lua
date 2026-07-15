local keymap = function(mode, lhs, rhs, desc)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, desc = desc })
end

-- Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Normal --
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", "Move to left window")
keymap("n", "<C-j>", "<C-w>j", "Move to lower window")
keymap("n", "<C-k>", "<C-w>k", "Move to upper window")
keymap("n", "<C-l>", "<C-w>l", "Move to right window")

-- Split window
keymap("n", "s", "<Nop>")
keymap("n", "ss", ":split<Return><C-w>w", "Split window horizontally")
keymap("n", "sv", ":vsplit<Return><C-w>w", "Split window vertically")

-- Close split window
keymap("n", "<C-w>", "<C-w>c", "Close window")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", "Select all")

-- Move to edge
keymap("n", "<leader>h", "^", "Move to line start")
keymap("n", "<leader>l", "$", "Move to line end")

-- Add blank line
keymap("n", "<leader>j", "o<ESC>", "Add blank line below")
keymap("n", "<leader>k", "<S-o><ESC>", "Add blank line above")

-- Replace
keymap("n", "<leader><S-s>", ":%s/", "Replace in file")

-- Stay in indent mode
keymap("v", "<", "<gv", "Indent left")
keymap("v", ">", ">gv", "Indent right")

-- No hlsearch
keymap("n", "<Esc><Esc>", ":nohlsearch<Return>", "Clear search highlight")

-- Terminal mode
keymap("n", "tt", ":belowright 10new<Return>:terminal<Return>", "Open terminal below")

-- Grep
keymap("n", "gw", "*", "Search word under cursor")

-- Yank
keymap("n", "d", '"_d', "Delete without yank")
keymap("x", "d", '"_d', "Delete without yank")
keymap("x", "p", '"_dP', "Paste without yank")

-- Plugins --
-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<Return>", "Find files")
keymap("n", "<leader>fg", ":Telescope live_grep<Return>", "Live grep")
keymap("n", "<leader>fb", ":Telescope buffers<Return>", "Buffers")
keymap("n", "<leader>fh", ":Telescope help_tags<Return>", "Help tags")

-- Neo tree
keymap("n", "<leader>nt", ":Neotree toggle<Return>", "Toggle Neo-tree")
keymap("n", "<leader>nr", ":Neotree focus<Return>:execute 'normal R'<Return>", "Refresh Neo-tree")

-- Gitsigns
keymap("n", "<leader>hs", ":Gitsigns stage_hunk<Return>", "Stage hunk")
keymap("v", "<leader>hs", ":Gitsigns stage_hunk<Return>", "Stage hunk")
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<Return>", "Reset hunk")
keymap("v", "<leader>hr", ":Gitsigns reset_hunk<Return>", "Reset hunk")
keymap("n", "<leader>hS", ":Gitsigns stage_buffer<Return>", "Stage buffer")
keymap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<Return>", "Undo stage hunk")
keymap("n", "<leader>hR", ":Gitsigns reset_buffer<Return>", "Reset buffer")
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<Return>", "Preview hunk")
keymap("n", "<leader>hb", ':lua require"gitsigns".blame_line{full=true}<Return>', "Blame line")
keymap("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<Return>", "Toggle line blame")
keymap("n", "<leader>hd", ":Gitsigns diffthis<Return>", "Diff this")
keymap("n", "<leader>hD", ':lua require"gitsigns".diffthis("~")<Return>', "Diff against last commit")
keymap("n", "<leader>td", ":Gitsigns toggle_deleted<Return>", "Toggle deleted lines")
