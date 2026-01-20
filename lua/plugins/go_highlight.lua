-- lua/plugins/go_highlight.lua
-- 目的：在不破坏 TokyoNight Storm 气质的前提下
--      强化 Go 的“工程语义可读性”

local M = {}

function M.setup()
  -- ========== Treesitter 语义层 ==========
  local set = vim.api.nvim_set_hl

  -- 类型 / struct / interface
  set(0, "@type.go",              { fg = "#7aa2f7", bold = true })
  set(0, "@type.definition.go",   { fg = "#7aa2f7", bold = true })

  -- struct 字段
  set(0, "@field.go",             { fg = "#c0caf5" })

  -- 函数定义
  set(0, "@function.definition.go", { fg = "#7dcfff", bold = true })

  -- 函数调用
  set(0, "@function.call.go",     { fg = "#73daca" })

  -- 方法调用 obj.Method()
  set(0, "@method.call.go",       { fg = "#73daca" })

  -- 参数
  set(0, "@parameter.go",         { fg = "#e0af68" })

  -- 常量 / 枚举感
  set(0, "@constant.go",          { fg = "#ff9e64", bold = true })

  -- 注释里的 TODO / FIXME
  set(0, "@comment.todo",         { fg = "#ff9e64", bold = true })
end

return M

