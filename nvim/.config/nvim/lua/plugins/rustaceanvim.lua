return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  ft = "rust",
  config = function ()
    local mason_registry = require('mason-registry')
    local codelldb = mason_registry.get_package("codelldb")
    -- local extension_path = codelldb:get_install_path() .. "/extension/"
    -- print(mason_registry.get_package("codelldb"))
    local extension_path = vim.fn.expand "$MASON/packages/codelldb" .. "extension"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
    local cfg = require("rustaceanvim.config")

    vim.g.rustaceanvim = {
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
    vim.lsp.inlay_hint.enable(true)
  end
}
