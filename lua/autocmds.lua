-- Create/get autocommand group
local augroup = vim.api.nvim_create_augroup
-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local lines = vim.api.nvim_buf_get_lines(0, -2, -1, false)
        local last_line = lines[1]

        -- Check if the last line is empty
        if not (last_line and last_line:match("^%s*$")) then
            vim.api.nvim_buf_set_lines(0, -1, -1, false, {""})
        end

        -- If there are only empty lines, delete all but one
        vim.cmd("%s/^\\s\\+$//e")
    end
})

-- Terminal mode
autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.cmd("startinsert")
        -- vim.opt.startinsert = true
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
    end
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o",
})

