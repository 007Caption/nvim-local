-- lua/plugins/init.lua
-- 只负责：声明装哪些插件，以及配置入口在哪里。
-- 原则：分类清晰；每个插件说明用途；配置逻辑放到 plugins/*.lua。

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

   -- 图标
  require("plugins.icons"),

  -- 目录树
  require("plugins.nvimtree"),

  -- ========== UI：状态栏 ==========
  require("plugins.lualine"),

  -- ========== Git：行内 diff / blame ==========
  require("plugins.gitsigns"),

  -- ========== UI：快捷键提示 ==========
  require("plugins.whichkey"),

  -- 括号对齐
  require("plugins.autopairs"),

  -- 快速注释
  require("plugins.comment"),


  -- ========== 主题 ==========
  {
   "tanvirtin/monokai.nvim",
   priority = 1000, -- 主题一定要最先加载
   config = function()
     require("plugins.theme").setup_monokai()
   end,
  },
  -- ========== LSP 安装与管理 ==========
  {
    "williamboman/mason.nvim",
    -- Mason：管理 LSP/formatter/debugger 等外部二进制工具（比如 gopls）。
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- Mason-LSPConfig：确保安装哪些 LSP（这里确保 gopls）。
    -- 注意：你已经迁到 nvim 0.11 的 vim.lsp.config/enable，所以这里只做安装层。
    config = function()
      require("plugins.lsp").setup_mason()
      require("plugins.lsp").setup_servers()
    end,
  },

  -- ========== 自动补全 ==========
  {
    "hrsh7th/nvim-cmp",
    -- nvim-cmp：补全框架（LSP 补全、片段补全统一入口）。
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- 让 LSP 补全能力进入 cmp
      "L3MON4D3/LuaSnip",         -- 片段引擎
      "saadparwaiz1/cmp_luasnip", -- cmp 读取 LuaSnip 片段
    },
    config = function()
      require("plugins.cmp").setup()
    end,
  },

  -- ========== 语法树（高亮/结构/缩进） ==========
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
     require("plugins.treesitter").setup()
    end,
  },

  -- ========== 文件树 ==========
 {
    "nvim-tree/nvim-tree.lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
     require("plugins.tree").setup()
   end,
  },

  -- ========== 模糊查找 / 搜索 ==========
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Telescope 必需的工具库
    },
    config = function()
      require("plugins.telescope").setup()
    end,
  },

  -- ========== 测试：Neotest（Go 单测 UI） ==========
 --  require("plugins.neotest"),


  -- ========== 格式化（保存自动 gofumpt/goimports） ==========
  {
    "stevearc/conform.nvim",
    -- Conform：专注格式化；保存时自动 gofumpt + goimports（格式 + imports 整理）。
    config = function()
      require("plugins.format").setup()
    end,
  },

}, {})

