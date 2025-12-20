-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "one_light",
  theme_toggle = { "onedark", "one_light" },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
    modules = {
      file = function()
        local utils = require "nvchad.stl.utils"
        local icon = utils.file()[1]
        local path = vim.api.nvim_buf_get_name(utils.stbufnr())
        local name = (path == "" and "Empty") or vim.fn.fnamemodify(path, ":~:.")
        return "%#StText# " .. icon .. " " .. name .. " "
      end,
    },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
