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

-- Git hunk navigation
map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    require("gitsigns").nav_hunk "next"
  end
end, { desc = "Jump to next git hunk" })

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    require("gitsigns").nav_hunk "prev"
  end
end, { desc = "Jump to prev git hunk" })

-- Git hunk actions
map("n", "<leader>rh", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset git hunk" })

map("n", "<leader>ph", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview git hunk" })

map("n", "<leader>sh", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage git hunk" })

map("n", "<leader>us", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage git hunk" })

map("n", "<leader>gb", function()
  package.loaded.gitsigns.blame_line()
end, { desc = "Blame line" })

map("n", "<leader>td", function()
  require("gitsigns").toggle_deleted()
end, { desc = "Toggle deleted" })
