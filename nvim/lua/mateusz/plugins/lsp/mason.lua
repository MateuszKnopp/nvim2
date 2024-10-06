return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "gopls",        -- Go
        "jdtls",        -- Java
        "sqlls",        -- SQL
        "dockerls",     -- Docker
        "yamlls",       -- YAML
        "jsonls",       -- JSON
        "html",         -- HTML (still useful for web dev)
        "cssls",        -- CSS
        "lua_ls",       -- Lua
        "emmet_ls",     -- Emmet (for HTML/CSS quick snippets)
        "prismals",     -- Prisma (for database)
        "pyright",      -- Python
        "bashls",
        "rust_analyzer",
      },
    })
  end,
}
