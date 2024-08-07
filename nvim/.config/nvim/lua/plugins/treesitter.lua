return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- ensure_installed = {"lua", "vim", "vimdoc", "javascript", "html", "python"},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
