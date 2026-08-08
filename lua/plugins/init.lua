return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      -- Options for the fidget UI
      progress = {
        suppress_on_insert = true, -- Suppress new messages while in insert mode
      },
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
        server = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                -- alternatively, you could use:
                -- features = { "feature1", "feature2" },
                -- noDefaultFeatures = false,
              },
            },
          },
        },
      }
    end,
  },

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup {}
      local cmp = require "cmp"
      local sources = cmp.get_config().sources
      table.insert(sources, 1, { name = "supermaven" })
      cmp.setup { sources = sources }
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = false,
        },
      }
    end,
  },

  -- {
  --   "github/copilot.vim",
  --   event = "InsertEnter",
  --   config = function()
  --     vim.g.copilot_no_tab_map = true
  --     vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
  --     vim.api.nvim_set_keymap("i", "<C-K>", "copilot#Dismiss()", { expr = true, silent = true })
  --   end,
  -- },
  --
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotChat" },
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      temperature = 0.1, -- Lower = focused, higher = creative
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float'
        width = 0.5, -- 50% of screen width
      },
      auto_insert_mode = true, -- Enter insert mode when opening     -- See Configuration section for options
    },
  },

  {
    "knsh14/vim-github-link",
    config = function()
      -- Optional: You can set up key mappings or additional configurations here
      vim.api.nvim_set_keymap("n", "<leader>gl", ":GetCommitLink<CR>", { noremap = true, silent = true })
    end,
    event = "InsertEnter",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    init = function()
      vim.treesitter.language.register("json5", "jsonc")
    end,
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "json5",
        "markdown",
        "markdown_inline",
      },
    },
  },

  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {},
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
    },
  },
}
