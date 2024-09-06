return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua, -- This requires you to install stylua in Mason
        -- Python
        -- Currentlyt none-ls does not have the flake8 definition working and I don't want to deal with it
        -- null_ls.builtins.diagnostics.flake8, -- This requires you to install flake8 in Mason
        null_ls.builtins.formatting.black, -- This requires you to install black in Mason
        null_ls.builtins.formatting.isort, -- This requires you to install isort in Mason
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
