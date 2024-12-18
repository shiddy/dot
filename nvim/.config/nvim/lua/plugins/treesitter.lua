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
      disable = function(lang, buf)
        local max_filesize = 100*1024 -- 100KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    })
  end,
}
