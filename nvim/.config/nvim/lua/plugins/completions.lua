return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    config = function()
      require "custom.completion"
    end,
  },
}
