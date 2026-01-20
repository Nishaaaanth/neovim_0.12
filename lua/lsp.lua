vim.diagnostic.config({
    signs = true,
    underline = true,
    -- virtual_lines = { current_line = true },
    severity_sort = true,
    float = {
        border = "single",
        source = true,
        wrap = true,
    },
})
