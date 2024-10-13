return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
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
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup {}
      local cmp = require "cmp"
      local sources = cmp.get_config().sources
      table.insert(sources, 1, { name = "supermaven" })
      cmp.setup { sources = sources }
    end,
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   -- cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup {}
  --   end,
  -- },

  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  {
    "knsh14/vim-github-link",
    config = function()
      -- Optional: You can set up key mappings or additional configurations here
      vim.api.nvim_set_keymap("n", "<leader>gl", ":GetCommitLink<CR>", { noremap = true, silent = true })
    end,
    event = "InsertEnter",
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
