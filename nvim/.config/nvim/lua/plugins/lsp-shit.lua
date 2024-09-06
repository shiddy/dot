return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pylsp", "denols"},
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.pylsp.setup({})
      -- lspconfig.tsserver.setup({
      --   on_attach = on_attach,
      --   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
      -- })
      -- lspconfig.vtsls.setup({})
      lspconfig.denols.setup({
        -- on_attach = on_attach,
        -- root_dir = nvim_lsp.util.root_pattern("package.json"),
        -- single_file_support = false
      })
      -- lspconfig.tailwindcss.setup({})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
