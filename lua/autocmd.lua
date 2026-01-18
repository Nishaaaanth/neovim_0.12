local terminal_group = vim.api.nvim_create_augroup("Terminal", { clear = true })
local yank_group = vim.api.nvim_create_augroup("Yank", { clear = true })
local colorscheme_group = vim.api.nvim_create_augroup("Colorscheme", { clear = true })

local function set_dark_bg()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#000000" })
end
set_dark_bg()

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    desc = "Updates dark backgroung",
    group = colorscheme_group,
    callback = set_dark_bg
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
    desc = "Remove numberline on terminal",
    group = terminal_group,
    callback = function()
        vim.o.nu = false
        vim.o.rnu = false
    end
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    desc = "Highlight when yanking text",
    group = yank_group,
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        vim.o.signcolumn = 'auto:1'
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.o.complete = 'o,.,w,b,u'
            vim.o.completeopt = 'menu,menuone,popup,noinsert,noselect'
            vim.lsp.completion.enable(true, client.id, args.buf)
        end
    end
})
