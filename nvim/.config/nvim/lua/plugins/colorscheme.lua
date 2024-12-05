return {
  "Mofiqul/dracula.nvim",
  config = function()
    local dracula = require("dracula")
    dracula.setup({
      -- transparent_bg = true,
      -- italic_comment = true,
      overrides = function (colors) 
        return {
        Comment = { fg = "#ffd6ab", bold = true, italic = true },
      }
      end,
    })
    vim.cmd.colorscheme("dracula")
  end,
}
