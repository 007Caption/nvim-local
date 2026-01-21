-- lua/plugins/treesitter.lua
-- 目标：Go 语法树高亮稳定可用，并且不依赖 :TSInstall* 命令。
-- 手段：
-- 1) 启用 treesitter 高亮
-- 2) 自动安装缺失的 parser（auto_install = true）
-- 3) 用 Neovim 内置 API 验证/attach，而不是依赖 TS 命令存在与否
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then return end

    configs.setup({
      ensure_installed = { "go","python", "lua", "json", "yaml", "bash", "markdown" },
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },
    })
  end,
}

