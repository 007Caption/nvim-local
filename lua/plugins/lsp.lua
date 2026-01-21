-- lua/plugins/lsp.lua
-- LSP 配置入口（Neovim 0.11+ 推荐方式）
-- 目标：
-- 1) 用 mason 安装 gopls（不靠系统手工装）
-- 2) 用 vim.lsp.config + vim.lsp.enable 启用 gopls
-- 3) 把常用 LSP 能力（definition/hover/rename/diagnostic）打通

local M = {}

function M.setup_mason()
  -- Mason：负责安装外部 LSP 二进制（例如 gopls）
  require("mason").setup()

  -- mason-lspconfig：只负责“确保安装”，不负责配置（配置交给 vim.lsp.config）
  require("mason-lspconfig").setup({
    ensure_installed = { "gopls" },
    automatic_installation = true,
  })
end

function M.setup_servers()
  -- ===== 1) 定义 gopls 的配置（Neovim 0.11 原生 API）=====
  -- vim.lsp.config("name", cfg)：注册一个 LSP server 的配置
  -- vim.lsp.enable("name")：对匹配 filetype 的 buffer 启用它
  vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gosum", "gowork" },

    -- 这里是 gopls 的能力/行为配置（按 Go IDE 常见需求来）
    settings = {
      gopls = {
        -- 更强的静态分析
        analyses = {
          unusedparams = false,
          fieldalignment = false,
          nilness = true,
          unusedwrite = true,
          useany = true,
        },
        staticcheck = false,

        -- 常用功能
        usePlaceholders = false,
        completeUnimported = true,

        -- 如果你是单 repo 多模块，可按需开
        -- env = { GOPLSCACHE = vim.fn.stdpath("cache") .. "/gopls" },
      },
    },
  })

  -- ===== 2) 启用 gopls =====
  vim.lsp.enable("gopls")

  -- ===== 3) 诊断显示风格（可选但建议）=====
  vim.diagnostic.config({
    virtual_text = true,      -- 行内提示
    severity_sort = true,     -- 严重程度排序
    float = { border = "rounded" },
  })
end

return M

