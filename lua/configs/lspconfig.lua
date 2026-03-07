require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = {
  "clangd",
  "cssls",
  "gopls",
  "html",
  "jsonls",
  "just-lsp",
  "kotlin_language_server",
  "ktfmt",
  "ktlint",
  "lua_ls",
  "pylsp",
  "solidity_ls",
  "textlsp",
  "ts_ls",
  -- "rust_analyzer", -- rustaceanvim handles it
}

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      buildFlags = { "-tags=integration_tests" },
    },
  },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
