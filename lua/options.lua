local options = {
    -- Basic
    encoding = "utf-8",
    fileencoding = "utf-8",
    backup = false,
    swapfile = false,
    autoread = true,
    hidden = true,
    showcmd = true,
    backspace = "indent,eol,start",
    mouse = "a",
    clipboard = "unnamedplus",

    -- Visual
    number = true,
    relativenumber = true,
    cursorline = true,
    visualbell = true,
    showmatch = true,
    laststatus = 2,
    wildmode = "list:longest",
    wrap = false,
    whichwrap = "b,s,h,l,<,>,[,],~",
    background = "dark",

    -- Indent
    expandtab = true,
    tabstop = 4,
    shiftwidth = 4,
    autoindent = true,
    smartindent = true,

    -- Search
    ignorecase = true,
    smartcase = true,
    incsearch = true,
    wrapscan = true,
    hlsearch = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- For nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

