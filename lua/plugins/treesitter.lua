-- lua/plugins/treesitter.lua
-- 目标：Go 语法树高亮稳定可用，并且不依赖 :TSInstall* 命令。
-- 手段：
-- 1) 启用 treesitter 高亮
-- 2) 自动安装缺失的 parser（auto_install = true）
-- 3) 用 Neovim 内置 API 验证/attach，而不是依赖 TS 命令存在与否

local M = {}

function M.setup()
  -- 1) 确保插件模块可用
  local ok, configs = pcall(require, "nvim-treesitter.configs")
  if not ok then
    return
  end

  configs.setup({
    ensure_installed = { "go", "gomod", "gosum", "gowork", "lua", "vim", "vimdoc" },

    -- 自动安装缺失 parser：打开 go 文件时自动装（需要 git/clang 可用）
    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },
  })

  -- 2) 强制在 Go 文件进入时确保 treesitter attach（只用内置 API）
  vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    callback = function(args)
      local ft = vim.bo[args.buf].filetype
      if ft == "go" or ft == "gomod" or ft == "gosum" or ft == "gowork" then
        -- Neovim 内置 treesitter 启动（如果 parser 可用就会 attach）
        pcall(vim.treesitter.start, args.buf)
      end
    end,
    desc = "Ensure treesitter attached for Go-related files",
  })
end

return M

