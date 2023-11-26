local opts = { noremap = true }

local keymap = vim.api.nvim_set_keymap

-- Quit terminal mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

