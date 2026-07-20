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

-- Copy file:line reference (e.g. path/to/file.ts:42 or :42-57 in visual mode)
local function copy_file_reference()
	local absolute_path = vim.fn.expand("%:p")
	if absolute_path == "" then
		vim.notify("No file associated with this buffer", vim.log.levels.WARN)
		return
	end

	local file
	local result = vim.system(
		{ "git", "-C", vim.fn.expand("%:p:h"), "rev-parse", "--show-toplevel" },
		{ text = true }
	):wait()
	if result.code == 0 then
		file = vim.fs.relpath(vim.trim(result.stdout), absolute_path)
	end
	file = file or vim.fn.fnamemodify(absolute_path, ":.")

	local reference
	if vim.fn.mode():match("[vV]") then
		local start_line, end_line = vim.fn.line("v"), vim.fn.line(".")
		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end
		reference = start_line == end_line and string.format("%s:%d", file, start_line)
			or string.format("%s:%d-%d", file, start_line, end_line)
	else
		reference = string.format("%s:%d", file, vim.api.nvim_win_get_cursor(0)[1])
	end

	vim.fn.setreg("+", reference)
	vim.notify("Copied: " .. reference)
end

vim.keymap.set({ "n", "v" }, "<leader>yr", copy_file_reference, { desc = "Copy file:line reference" })

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
