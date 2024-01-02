local function set_indent(filetype, sw, ts)
	vim.cmd(string.format("autocmd FileType %s setlocal shiftwidth=%d tabstop=%d", filetype, sw, ts))
end

vim.cmd([[
augroup IndentSettings
    autocmd!
]])

-- You can check available filetypes by 'ls /usr/share/nvim/runtime/ftplugin'
set_indent("cpp", 2, 2)
set_indent("javascript", 2, 2)
set_indent("lua", 2, 2)
set_indent("yaml", 2, 2)

set_indent("go", 4, 4)
set_indent("json", 4, 4)
set_indent("python", 4, 4)

vim.cmd("augroup END")
