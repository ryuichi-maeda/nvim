-- Create/get autocommand group
-- local augroup = vim.api.nvim_create_augroup
-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd

-- Neovim's builtin ".tf" detection falls back to filetype "tf" (not
-- "terraform") when the buffer is still empty (e.g. right after :e on a
-- brand new file), so newly created files aren't highlighted until
-- something forces re-detection. Always treat ".tf" as terraform.
vim.filetype.add({
	extension = {
		tf = "terraform",
	},
})

-- On save
autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		-- Format --
		require("conform").format({ bufnr = args.buf })
		--[[
        -- Remove whitespace on save --
        local lines = vim.api.nvim_buf_get_lines(0, -2, -1, false)
        local last_line = lines[1]

        -- Check if the last line is empty
        if not (last_line and last_line:match("^%s*$")) then
            vim.api.nvim_buf_set_lines(0, -1, -1, false, {""})
        end

        -- If there are only empty lines, delete all but one
        vim.cmd("%s/^\\s\\+$//e")
]]
		--
	end,
})

-- Terminal mode
autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.cmd("startinsert")
		-- vim.opt.startinsert = true
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
	end,
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- Markdown editing helpers (buffer-local, <leader>m prefix to avoid clashes)
autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true, desc = "Markdown: " .. desc })
		end

		-- Visual mode: wrap the selection
		-- (c deletes the selection into the unnamed register, then we retype it wrapped)
		map("x", "<leader>mb", 'c**<C-r>"**<Esc>', "Bold")
		map("x", "<leader>mi", 'c*<C-r>"*<Esc>', "Italic")
		map("x", "<leader>mc", 'c`<C-r>"`<Esc>', "Inline code")
		map("x", "<leader>ms", 'c~~<C-r>"~~<Esc>', "Strikethrough")
		-- Link: [selection](|) with cursor left inside () in insert mode to type the URL
		map("x", "<leader>ml", 'c[<C-r>"]()<Left>', "Link")

		-- Normal mode: operate on the word under the cursor
		map("n", "<leader>mb", 'viwc**<C-r>"**<Esc>', "Bold word")
		map("n", "<leader>mi", 'viwc*<C-r>"*<Esc>', "Italic word")
		map("n", "<leader>mc", 'viwc`<C-r>"`<Esc>', "Inline code word")
		map("n", "<leader>ml", 'viwc[<C-r>"]()<Left>', "Link word")

		-- Table mode toggle (vim-table-mode)
		map("n", "<leader>mt", "<cmd>TableModeToggle<cr>", "Toggle table mode")
	end,
})
