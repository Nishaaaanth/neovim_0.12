local GIT = "https://github.com/"

local plugins = {
    mason = "mason-org/mason.nvim",
    pick = "echasnovski/mini.pick",
    nvim_java = "nvim-java/nvim-java",
    nui = "MunifTanjim/nui.nvim",
    springboot = {
        src = 'JavaHello/spring-boot.nvim',
        version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
    },
    nvim_dap = "mfussenegger/nvim-dap",
}

local colorschemes = {
    kanagawa = "rebelot/kanagawa.nvim",
    tokyonight = "folke/tokyonight.nvim",
    catppuccin = "catppuccin/nvim",
    rosepine = "rose-pine/neovim"
}

vim.pack.add({
    { src = GIT .. plugins.mason },
    { src = GIT .. plugins.pick },
    { src = GIT .. plugins.nvim_java },
    { src = GIT .. plugins.nui },

    { src = GIT .. colorschemes.kanagawa },
    { src = GIT .. colorschemes.rosepine },
})

require("mason").setup {}
require("java").setup {
    checks = {
        nvim_version = true,
        nvim_jdtls_conflict = true,
    },

    lombok = {
        enable = true,
        -- version = '1.18.40',
    },

    java_test = {
        enable = false,
        -- version = '0.40.1',
    },

    java_debug_adapter = {
        enable = false,
        version = '0.58.2',
    },

    spring_boot_tools = {
        enable = false,
        version = '1.55.1',
    },

    jdk = {
        auto_install = false,
        version = '17',
    },

    log = {
        use_console = true,
        use_file = true,
        level = 'info',
        log_file = vim.fn.stdpath('state') .. '/nvim-java.log',
        max_lines = 1000,
        show_location = false,
    },
}

-- Update the below in ~/.config/ripgrep/config file and set the RIPGREP_CONFIG_PATH
-- --hidden
-- --no-ignore
-- --glob
-- --!**/.git/*
require("mini.pick").setup {
    source = {
        files = {
            hidden = true
        }
    },
    mappings = {
        toggle_info    = 'I',
        toggle_preview = 'K',
        move_down      = '<Tab>',
        move_up        = '<S-Tab>',
    },
}
