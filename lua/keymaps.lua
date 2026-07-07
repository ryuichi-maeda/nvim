local opts = { noremap = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Normal --
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Split window
keymap("n", "s", "<Nop>", opts)
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Close split window
keymap("n", "<C-w>", "<C-w>c", opts)

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

-- Terminal mode
keymap("n", "tt", ":belowright 10new<Return>:terminal<Return>", opts)

-- Grep
keymap("n", "gw", "*", opts)

-- Yank
keymap("n", "d", "\"_d", opts)
keymap("x", "d", "\"_d", opts)
keymap("x", "p", "\"_dp", opts)

-- Plugins --
-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<Return>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<Return>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<Return>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<Return>", opts)

-- Neo tree
keymap("n", "<leader>nt", ":Neotree toggle<Return>", opts)
keymap("n", "<leader>nr", ":Neotree focus<Return>:execute 'normal R'<Return>", opts)

-- Gitsigns
keymap("n", "<leader>hs", ":Gitsigns stage_hunk<Return>", opts)
keymap("v", "<leader>hs", ":Gitsigns stage_hunk<Return>", opts)
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<Return>", opts)
keymap("v", "<leader>hr", ":Gitsigns reset_hunk<Return>", opts)
keymap("n", "<leader>hS", ":Gitsigns stage_buffer<Return>", opts)
keymap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<Return>", opts)
keymap("n", "<leader>hR", ":Gitsigns reset_buffer<Return>", opts)
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<Return>", opts)
keymap("n", "<leader>hb", ':lua require"gitsigns".blame_line{full=true}<Return>', opts)
keymap("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<Return>", opts)
keymap("n", "<leader>hd", ":Gitsigns diffthis<Return>", opts)
keymap("n", "<leader>hD", ':lua require"gitsigns".diffthis("~")<Return>', opts)
keymap("n", "<leader>td", ":Gitsigns toggle_deleted<Return>", opts)
