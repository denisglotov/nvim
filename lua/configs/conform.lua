local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt_nightly" },
    css = { "prettier" },
    html = { "prettier" },
  },

  formatters = {
    rustfmt_nightly = {
      command = "rustfmt",
      args = { "+nightly", "--emit=stdout" },
      stdin = true,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
