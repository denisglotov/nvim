require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = {
  "clangd",
  "cssls",
  "gopls",
  "jsonls",
  "html",
  "lua_ls",
  "pylsp",
  -- "rust_analyzer", -- rustaceanvim handles it
  "solidity_ls",
  "textlsp",
  "ts_ls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
