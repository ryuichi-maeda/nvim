# My Neovim Settings

## Install Neovim

I recommend you to install Neovim by `nvim.appimage` to install latest Neovim.

You can install it on the Neovim website.

If the version is old, you may not be able to use the following plugins.

### For Homebrew user

```
brew install neovim
brew install --cask font-0xproto-nerd-font
```

## How to set

```
mv ~/path/to/this/repo ~/.config/nvim
```

## Yank Settings

Simple 'vim' package does not support clipboard settings.

```
sudo apt install vim-gtk
sudo apt install xclip
```

## Plugins

### numToStr/Comment.nvim

You can comment out with `<C-/>`

### stevearc/conform.nvim

Fotmat on save. You have to install formatters with Mason.

### lewis6991/gitsigns.nvim

You can check the change of files by signs.

### nvim-lualine/lualine.nvim

Design of status line. Theme is needed to be downloaded beforehand.

### williamboman/mason.nvim

You can install LSP, formatters,, with `:Mason` command.
This is needed for **stevearc/cnoform.nvim** and **neovim/nvim-lspconfig.nvim** plugins.

### colorschemes

- **Edeneast/nightfox.nvim**
- **folke/tokyonight.nvim**
- **Mofiqul/vscode.nvim**

If you want to change colorscheme, you have to change lazynvim.lua.

```
-- Example
vim.cmd[[colorscheme vscode]]
```

You can also change status line in **lualine.lua**.

### hrsh7th/nvim-cmp

Auto complete.

### neovim/nvim-lspconfig

LSP.

### nvim-neo-tree/neo-tree.nvim

File tree.

### nvim-telescope/telescope.nvim

Fuzzy finder.

### nvim-treesitter/nvim-treesitter

Syntax highlight.

## Key bindings

| Mode    | Keybinding       | Function                                         |
|---------|------------------|--------------------------------------------------|
| Normal  | `<Space>`        | Remap space as leader key                        |
| Normal  | `<C-h>`          | Navigate to the left window                      |
| Normal  | `<C-j>`          | Navigate to the window below                     |
| Normal  | `<C-k>`          | Navigate to the window above                     |
| Normal  | `<C-l>`          | Navigate to the right window                     |
| Normal  | `s`              | (Keybinding disabled)                            |
| Normal  | `ss`             | Horizontal split                                 |
| Normal  | `sv`             | Vertical split                                   |
| Normal  | `<C-w>`          | Close split window                               |
| Normal  | `<C-a>`          | Select all                                       |
| Normal  | `<leader>h`      | Move to the start of the line                    |
| Normal  | `<leader>l`      | Move to the end of the line                      |
| Normal  | `<leader>j`      | Add a blank line below                           |
| Normal  | `<leader>k`      | Add a blank line above                           |
| Normal  | `<leader><S-s>`  | Replace                                          |
| Visual  | `<`              | Indent left                                      |
| Visual  | `>`              | Indent right                                     |
| Normal  | `<Esc><Esc>`     | Turn off search highlighting                     |
| Normal  | `tt`             | Open a new terminal window below                 |
| Normal  | `gw`             | Search for the current word                      |
| Normal  | `<leader>ff`     | Telescope: Find files                            |
| Normal  | `<leader>fg`     | Telescope: Live grep                             |
| Normal  | `<leader>fb`     | Telescope: Buffers                               |
| Normal  | `<leader>fh`     | Telescope: Help tags                             |
| Normal  | `<leader>nt`     | Neo tree: Toggle                                 |
| Normal  | `<leader>nr`     | Neo tree: Focus and refresh                      |
| Normal  | `<leader>hs`     | Gitsigns: Stage hunk                             |
| Visual  | `<leader>hs`     | Gitsigns: Stage hunk (visual mode)               |
| Normal  | `<leader>hr`     | Gitsigns: Reset hunk                             |
| Visual  | `<leader>hr`     | Gitsigns: Reset hunk (visual mode)               |
| Normal  | `<leader>hS`     | Gitsigns: Stage buffer                           |
| Normal  | `<leader>hu`     | Gitsigns: Undo stage hunk                        |
| Normal  | `<leader>hR`     | Gitsigns: Reset buffer                           |
| Normal  | `<leader>hp`     | Gitsigns: Preview hunk                           |
| Normal  | `<leader>hb`     | Gitsigns: Blame line (full)                      |
| Normal  | `<leader>tb`     | Gitsigns: Toggle current line blame              |
| Normal  | `<leader>hd`     | Gitsigns: Show `diff`                            |
| Normal  | `<leader>hD`     | Gitsigns: Show `diff` with a specific commit     |
| Normal  | `<leader>td`     | Gitsigns: Toggle deleted lines                   |

## Tips

### Grep and chenge words

You can grep current forcused word by `gw`. 

After this, you can change the word by `cgn` and change the following grepped word by `.`.
