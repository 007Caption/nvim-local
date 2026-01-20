-- lua/plugins/highlight.lua
-- 目的：在不换主题的情况下，把 Go 的语义高亮拉开层次
-- 原理：覆盖一些 Treesitter 的高亮组（@xxx）和 LSP 语义组，让关键结构更醒目
-- 注意：这是“主题补丁”，主题更新不受影响，维护成本低

local M = {}

function M.setup()
  -- 每次 colorscheme 切换都重新应用（避免被主题覆盖）
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      -- 关键字/类型/函数更突出
      vim.api.nvim_set_hl(0, "@keyword", { bold = true })
      vim.api.nvim_set_hl(0, "@keyword.function", { bold = true })
      vim.api.nvim_set_hl(0, "@type", { bold = true })
      vim.api.nvim_set_hl(0, "@type.builtin", { bold = true })
      vim.api.nvim_set_hl(0, "@function", { bold = true })
      vim.api.nvim_set_hl(0, "@method", { bold = true })

      -- 字符串、数字更清晰
      vim.api.nvim_set_hl(0, "@string", {})
      vim.api.nvim_set_hl(0, "@number", { bold = true })

      -- 注释更“退后”，代码更凸显（你有中文注释也会更舒服）
      vim.api.nvim_set_hl(0, "@comment", { italic = true })
    end,
    desc = "Enhance Treesitter highlights for Go (theme patch)",
  })
end

return M

