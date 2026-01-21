-- lua/plugins/theme.lua
-- 作用：
--  1. 启用 Monokai 主题
--  2. 让 Treesitter / Go 的语义“明显区分”
--  3. 不搞花活，追求工程可读性

-- local M = {}
--
-- function M.setup_monokai()
--   require("monokai").setup({
--     -- classic / pro / soda / ristretto
--     -- ristretto 对比最舒服，推荐
--     palette = "ristretto",
--
--     -- 是否透明背景（你现在先别开）
--     transparent_background = false,
--
--     -- 注释稍微弱一点，但可读
--     italics = {
--       comments = true,
--       keywords = false,
--       functions = false,
--       variables = false,
--     },
--   })
--
--   vim.cmd("colorscheme monokai")
-- end
--
-- return M


-- lua/plugins/theme.lua
local M = {}

function M.setup_tokyonight()
  require("tokyonight").setup({
    style = "storm",
    transparent = false,        -- 非常重要：必须 false
    terminal_colors = true,

    styles = {
      comments  = { italic = false },
      keywords  = { italic = false },
      functions = { bold = true },
      variables = {},
    },

    dim_inactive = false,

    on_colors = function(colors)
      -- ====== 背景彻底锁死（核心） ======
      colors.bg       = "#1a1b26"  -- TokyoNight 官方 storm bg
      colors.bg_dark  = "#16161e"
      colors.bg_float = "#16161e"
      colors.bg_popup = "#16161e"
      colors.bg_sidebar = "#16161e"
      colors.bg_statusline = "#16161e"

      -- 前景 & 注释
      colors.fg      = "#c0caf5"
      colors.comment = "#565f89"
    end,
  })

  vim.cmd.colorscheme("tokyonight-storm")

  -- ====== 再保险：强制 Normal 背景 ======
  vim.api.nvim_set_hl(0, "Normal",       { bg = "#1a1b26", fg = "#c0caf5" })
  vim.api.nvim_set_hl(0, "NormalNC",     { bg = "#1a1b26", fg = "#c0caf5" })
  vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "#16161e", fg = "#c0caf5" })
  vim.api.nvim_set_hl(0, "SignColumn",   { bg = "#1a1b26" })
  vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = "#1a1b26", fg = "#1a1b26" })

  -- ====== CursorLine 不要“亮条” ======
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1f2335" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7aa2f7", bold = true })
end

return M

