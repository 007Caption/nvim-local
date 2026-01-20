-- lua/plugins/theme.lua
-- 作用：
--  1. 启用 Monokai 主题
--  2. 让 Treesitter / Go 的语义“明显区分”
--  3. 不搞花活，追求工程可读性

local M = {}

function M.setup_monokai()
  require("monokai").setup({
    -- classic / pro / soda / ristretto
    -- ristretto 对比最舒服，推荐
    palette = "ristretto",

    -- 是否透明背景（你现在先别开）
    transparent_background = false,

    -- 注释稍微弱一点，但可读
    italics = {
      comments = true,
      keywords = false,
      functions = false,
      variables = false,
    },
  })

  vim.cmd("colorscheme monokai")
end

return M

