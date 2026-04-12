-- Line Numbers
vim.o.nu = true
vim.o.rnu = true

-- Indents
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Colors & Highlights
vim.o.termguicolors = true
vim.g.bg = "dark"
vim.o.hlsearch = false
vim.o.cursorline = true
vim.o.numberwidth = 1
vim.o.signcolumn = "auto:1"
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
vim.o.winborder = "rounded"
vim.o.ignorecase = true
vim.o.showmode = false

-- Supress Warnings
vim.g.loaded_node_provider = false
vim.g.loaded_perl_provider = false
vim.g.loaded_python3_provider = false

-- Split
vim.o.splitbelow = true
vim.o.splitright = true

-- Edit
vim.o.wrap = true
vim.o.scrolloff = 15
vim.o.virtualedit = "block"
vim.o.autocomplete = true

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 26

-- Misc
vim.o.mouse = "a"
vim.o.inccommand = "split"
vim.o.updatetime = 50
vim.o.clipboard = "unnamedplus"
vim.o.statusline = "[%n] %<%f %h%w%m%r%=%-14.(%l,%c%V%) %P"
vim.cmd("set completeopt+=noselect")
