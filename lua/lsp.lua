vim.lsp.enable({
    "lua_ls",
    "jdtls"
})

vim.diagnostic.config({
    signs = true,
    underline = true,
    virtual_lines = { current_line = true },
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    }
})
