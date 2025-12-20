require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Toggle keymap
do
  local ih = vim.lsp.inlay_hint
  vim.keymap.set("n", "<leader>h", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local enabled = ih.is_enabled { bufnr = bufnr }
    ih.enable(not enabled, { bufnr = bufnr })
  end, { desc = "Toggle inlay hints" })
end

-- relative path of current buffer
map("n", "<leader>cr", function()
  local path = vim.fn.expand "%"
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy relative file path" })

-- absolute path of current buffer
map("n", "<leader>cp", function()
  local path = vim.fn.expand "%:p"
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy absolute file path" })
