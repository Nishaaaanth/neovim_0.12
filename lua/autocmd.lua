local terminal_group = vim.api.nvim_create_augroup("Terminal", { clear = true })
local yank_group = vim.api.nvim_create_augroup("Yank", { clear = true })
local lsp_group = vim.api.nvim_create_augroup("Lsp", { clear = true })
local colorscheme_group = vim.api.nvim_create_augroup("Colorscheme", { clear = true })

local function set_dark_bg()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "", { bg = "#000000", fg = "#ffffff" })
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
        vim.hl.on_yank()
    end
})

vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = lsp_group,
    callback = function(e)
        -- local conform = require("conform")

        -- vim.keymap.set("n", "<leader>lf", conform.format, { buffer = e.buf, desc = "[L]sp [F]ormat" })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = e.buf, desc = "[L]sp [F]ormat" })
        vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, { buffer = e.buf, desc = "[L]sp [k]over" })
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { buffer = e.buf, desc = "[L]sp [D]efinition" })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = e.buf, desc = "[L]sp [R]ename" })
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = e.buf, desc = "[L]sp code [A]ction" })
    end
})

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     desc = "Enable on file change",
--     pattern = 'java',
--     group = lsp_group,
--     callback = function()
--         vim.lsp.enable('jdtls')
--     end
-- })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     desc = "Enable on file change",
--     pattern = 'json',
--     group = lsp_group,
--     callback = function()
--         vim.lsp.enable('jsonls')
--     end
-- })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     desc = "Enable on file change",
--     pattern = 'lua',
--     group = lsp_group,
--     callback = function()
--         vim.lsp.enable('lua_ls')
--     end
-- })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     desc = "Enable on file change",
--     pattern = 'xml',
--     group = lsp_group,
--     callback = function()
--         vim.lsp.enable('lemminx')
--     end
-- })

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
