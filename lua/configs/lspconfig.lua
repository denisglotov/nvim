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
  "ruff",
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

-- Only attach ruff when a ruff config file is present
vim.lsp.config("ruff", {
  root_markers = { "ruff.toml", ".ruff.toml", "pyproject.toml" },
})

-- Let ruff handle linting primarily; disable pylsp's overlapping linters
vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
      },
    },
  },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
