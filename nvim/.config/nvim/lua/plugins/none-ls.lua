return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls") -- Still uses "null-ls" as the module name internally

    -- The lengths I will go to try to not remember whether json needs trailing commas in a list...
    -- I fixed this with json-nvim and added a map to invoke this on the whole file instead of fucking
    -- around with the nightmare of null-ls/none-ls for way to fucking long...
    -- local fixjson = {
    --   name = "fixjson",
    --   method = null_ls.methods.FORMATTING,
    --   filetypes = { "json" },
    --   generator = null_ls.generator({
    --     command = vim.fn.stdpath("data") .. "/mason/bin/fixjson", -- Path to Mason-installed fixjson
    --     -- command = "/Users/user/fixjson-debug.sh", -- Path to Mason-installed fixjson
    --     args = { "--force", "-" }, -- Arguments for fixjson
    --     to_stdin = true, -- Ensure input is passed via stdin
    --     timeout = 5000,
    --     -- on_output = function(output)
    --     --   return output -- Pass output directly from fixjson
    --     -- end,
    --    on_output = function(params)
    --       -- params.output should already be the raw output of fixjson
    --       if not params or not params.output then
    --           vim.notify("[fixjson] No output received from fixjson", vim.log.levels.ERROR)
    --           return nil
    --       end
    --
    --       -- Return the raw output directly as fixjson generates it
    --       return params.output
    --     end,
    --   })
    -- }


    null_ls.setup({
      debug = true,
      sources = {
        -- Add your desired sources here
        null_ls.builtins.formatting.stylua, -- This requires you to install stylua in Mason
        -- Python
        -- Currently none-ls does not have the flake8 definition working and I don't want to deal with it
        -- null_ls.builtins.diagnostics.flake8, -- This requires you to install flake8 in Mason
        null_ls.builtins.formatting.black, -- This requires you to install black in Mason
        null_ls.builtins.formatting.isort, -- This requires you to install isort in Mason
        -- fixjson,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer with LSP" })
  end,
}
