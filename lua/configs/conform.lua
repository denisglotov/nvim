local util = require "conform.util"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt_nightly" },
    css = { "prettier" },
    html = { "prettier" },
    kotlin = { "ktlint" },
    kts = { "ktlint" },
  },

  formatters = {
    rustfmt_nightly = {
      command = "rustfmt",
      args = { "+nightly", "--emit=stdout" },
      stdin = true,
    },
    ktlint = {
      command = "ktlint",
      args = { "--format", "--stdin", "--stdin-path", "$FILENAME", "--log-level=none" },
      stdin = true,
      cwd = util.root_file { ".editorconfig", "gradlew", "settings.gradle.kts" },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

return options
