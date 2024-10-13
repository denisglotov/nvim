-- load defaults i.e lua_lsp
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
  "rust_analyzer",
  "solidity_ls",
  "textlsp",
  "ts_ls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- lspconfig.typos_lsp.setup {
--   -- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
--   cmd_env = { RUST_LOG = "error" },
--   init_options = {
--     -- Custom config. Used together with a config file found in the workspace or its parents,
--     -- taking precedence for settings declared in both.
--     -- Equivalent to the typos `--config` cli argument.
--     config = "~/typos.toml",
--     -- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
--     -- Defaults to error.
--     diagnosticSeverity = "Error",
--   },
-- }
