-- Functions
local function get_project_root()
    local markers = { ".git", "pom.xml", "package.json" }
    local path = vim.fn.expand("%:p:h")

    while path ~= "/" do
        for _, marker in ipairs(markers) do
            if vim.fn.glob(path .. "/" .. marker) ~= "" then
                return path
            end
        end
        path = vim.fn.fnamemodify(path, ":h")
    end

    return vim.fn.getcwd()
end

-- Generals
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>e", "<CMD>Ex<CR>")

-- Term <-> Pane
vim.keymap.set({ "t", "i" }, "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set({ "t", "i" }, "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set({ "t", "i" }, "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set({ "t", "i" }, "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Splits
vim.keymap.set("n", "<leader>t", "<CMD>lcd %:p:h<CR><CMD>sp<CR><CMD>resize -10<CR><CMD>term<CR>i", { desc = "[t]erm" })
vim.keymap.set("n", "<leader>wl", "<CMD>vsp<CR>", { desc = "[W]indow [v]ertical" })
vim.keymap.set("n", "<leader>wj", "<CMD>sp<CR>", { desc = "[W]indow [h]orizontal" })

-- Tabs
vim.keymap.set("n", "<M-t>", "<CMD>tabnew<CR>", {})
vim.keymap.set("n", "<M-n>", "<CMD>tabNext<CR>", {})

-- Windows
vim.keymap.set("n", "<M-,>", "<C-w>3<", {})
vim.keymap.set("n", "<M-.>", "<C-w>3>", {})
vim.keymap.set("n", "<M-=>", "<C-w>3+", {})
vim.keymap.set("n", "<M-->", "<C-w>3-", {})

-- Pack
vim.keymap.set("n", "<leader>pu", "<CMD>lua vim.pack.update()<CR>", { desc = "Lua [P]ack [U]pdate" })

-- Pick
vim.keymap.set("n", "<leader>sh", "<CMD>Pick help<CR>", { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sg", "<CMD>Pick grep_live<CR>", { desc = "[S]earch [G]rep" })
vim.keymap.set("n", "<leader>sb", "<CMD>Pick buffers<CR>", { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<leader>sf", function()
    local target_dir = "~/"
    MiniPick.builtin.files(nil, {
        source = {
            cwd = target_dir,
            name = "All Files",
        },
    })
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sc", function()
    local target_dir = "~/.config/nvim"
    MiniPick.builtin.files(nil, {
        source = {
            cwd = target_dir,
            name = "NVIM config",
        },
    })
end, { desc = "[S]earch [C]onfig" })
vim.keymap.set("n", "<leader><leader>", function()
    local target_dir = get_project_root()
    MiniPick.builtin.files(nil, {
        source = {
            cwd = target_dir,
            name = "project files",
        },
    })
end, { desc = "Project Files" })

-- Lsp
vim.keymap.set("n", "<leader>dn", function()
    vim.diagnostic.jump({
        count = 1,
        float = true,
        severity = {
            min = vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.ERROR,
        },
    })
end, { desc = "[D]iagnostic error [N]ext" })
vim.keymap.set("n", "<leader>dp", function()
    vim.diagnostic.jump({
        count = -1,
        float = true,
        severity = {
            min = vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.ERROR,
        },
    })
end, { desc = "[D]iagnostic error [P]revious" })

-- Autocompletion
vim.keymap.set("i", "<Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })
vim.keymap.set("i", "<S-Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-h>"
end, { expr = true })

vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() == 1 then
        return vim.api.nvim_replace_termcodes('<C-y>', true, true, true)
    else
        return vim.api.nvim_replace_termcodes('<CR>', true, true, true)
    end
end, { expr = true }
)

-- Snippets
vim.keymap.set(
    "n",
    "<leader>cj",
    "<CMD>-1read ~/.config/nvim/templates/.java.compilation<CR>",
    { desc = "[L]sp [R]ename" }
)
