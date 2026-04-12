local GIT = "https://github.com/"

local plugins = {
	"mason-org/mason.nvim",
	"echasnovski/mini.pick",
    "mfussenegger/nvim-jdtls",
	-- "stevearc/conform.nvim",
	-- "saghen/blink.cmp",
	-- "nvim-java/nvim-java",
	-- "MunifTanjim/nui.nvim",
	-- {
	--     src = 'JavaHello/spring-boot.nvim',
	--     version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
	-- },
	-- "mfussenegger/nvim-dap",
}

local colorschemes = {
	"folke/tokyonight.nvim",
	"catppuccin/nvim",
	"rose-pine/neovim",
}

for _, plugin in pairs(plugins) do
	vim.pack.add({
		{ src = GIT .. plugin },
	})
end

for _, color in pairs(colorschemes) do
	vim.pack.add({
		{ src = GIT .. color },
	})
end

require("mason").setup({})
-- require("java").setup {
--     checks = {
--         nvim_version = true,
--         nvim_jdtls_conflict = true,
--     },
--
--     lombok = {
--         enable = true,
--         -- version = '1.18.40',
--     },
--
--     java_test = {
--         enable = false,
--         -- version = '0.40.1',
--     },
--
--     java_debug_adapter = {
--         enable = false,
--         version = '0.58.2',
--     },
--
--     spring_boot_tools = {
--         enable = false,
--         version = '1.55.1',
--     },
--
--     jdk = {
--         auto_install = false,
--         version = '17',
--     },
--
--     log = {
--         use_console = true,
--         use_file = true,
--         level = 'info',
--         log_file = vim.fn.stdpath('state') .. '/nvim-java.log',
--         max_lines = 1000,
--         show_location = false,
--     },
-- }

-- Update the below in ~/.config/ripgrep/config file and set the RIPGREP_CONFIG_PATH
-- --hidden
-- --no-ignore
-- --glob
-- --!**/.git/*
require("mini.pick").setup({
	source = {
		files = {
			hidden = true,
		},
	},
	mappings = {
		toggle_info = "I",
		toggle_preview = "K",
		move_down = "<Tab>",
		move_up = "<S-Tab>",
	},
})

-- require("conform").setup({
-- 	formatters_by_ft = {
-- 		lua = { "stylua" },
-- 	},
-- })

-- require("blink.cmp").setup({
-- 	keymap = {
-- 		preset = "default",
-- 		["<Tab>"] = { "select_next", "fallback" },
-- 		["<S-Tab>"] = { "select_prev", "fallback" },
-- 	},
-- 	appearance = {
-- 		nerd_font_variant = "mono",
-- 	},
-- 	completion = { documentation = { auto_show = true } },
-- 	sources = {
-- 		default = { "lsp", "path", "snippets", "buffer" },
-- 	},
-- 	fuzzy = { implementation = "lua" },
-- })
