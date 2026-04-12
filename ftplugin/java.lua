local config = {
    name = "jdtls",
    -- cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls"), "-Dorg.slf4j.simpleLogger.defaultLogLevel=warn" },
    cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
    root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" }),
    settings = {
        java = {},
    },
    init_options = {
        bundles = {},
    },
}
require("jdtls").start_or_attach(config)
