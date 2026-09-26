require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = {
  "clangd",
  "cssls",
  "eslint",
  "glsl_analyzer",
  "gopls",
  "html",
  "jsonls",
  "just-lsp",
  -- "kotlin_lsp", -- kotlin.nvim handles it
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

vim.lsp.config("solidity_ls", {
  cmd = { "forge", "lsp" },
  root_markers = { "foundry.toml", ".git" },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
