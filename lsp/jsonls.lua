-- vim.lsp.config('lua-language-server', {
return {
    cmd = { 'json-lsp' },
    filetypes = { 'json' },
    root_markers = {
        '.json',
        '.git',
    },
}
