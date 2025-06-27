return {
  "VPavliashvili/json-nvim",
  ft = "json", -- only load for json filetypes
  config = function()
      vim.keymap.set("n", "<leader>jb", '<cmd>JsonFormatFile<cr>')
      vim.keymap.set("n", "<leader>jm", '<cmd>JsonMinifyFile<cr>')
      vim.keymap.set("n", "<leader>jf", function()
        vim.cmd("%!fixjson --force")
  end, { desc = "Format JSON with fixjson" })
  end,
}
