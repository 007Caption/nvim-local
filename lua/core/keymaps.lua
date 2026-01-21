-- lua/core/keymaps.lua
-- 全局快捷键（通用、高频）
-- 目标：which-key 展示时“像中文菜单一样可读”

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ========== 基础操作 ==========
map("n", "<leader>w", "<cmd>w<cr>", vim.tbl_extend("force", opts, {
  desc = "保存：写入当前文件"
}))
map("n", "<leader>q", "<cmd>q<cr>", vim.tbl_extend("force", opts, {
  desc = "退出：关闭当前窗口"
}))
map("n", "<leader>h", "<cmd>nohlsearch<CR>", vim.tbl_extend("force", opts, {
  desc = "搜索：清除高亮"
}))

-- ========== 窗口管理 ==========
map("n", "<leader>sv", "<cmd>vsplit<cr>", vim.tbl_extend("force", opts, {
  desc = "窗口：垂直分屏"
}))
map("n", "<leader>sh", "<cmd>split<cr>", vim.tbl_extend("force", opts, {
  desc = "窗口：水平分屏"
}))
map("n", "<leader>sc", "<cmd>close<cr>", vim.tbl_extend("force", opts, {
  desc = "窗口：关闭当前窗口"
}))

-- ========== 编辑体验 ==========
map("n", "J", "mzJ`z", vim.tbl_extend("force", opts, {
  desc = "编辑：合并下一行并保持光标位置"
}))

-- ========== LSP：代码导航 ==========
map("n", "<leader>gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, {
  desc = "代码：跳转到定义"
}))
map("n", "<leader>gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, {
  desc = "代码：查找所有引用"
}))
map("n", "<leader>gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, {
  desc = "代码：跳转到实现"
}))
map("n", "<leader>gt", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, {
  desc = "代码：跳转到类型定义"
}))

-- ========== LSP：辅助操作 ==========
map("n", "<leader>k", vim.lsp.buf.hover, vim.tbl_extend("force", opts, {
  desc = "代码：查看悬浮文档"
}))
map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, {
  desc = "重构：重命名符号"
}))
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, {
  desc = "代码：执行 Code Action"
}))

-- ========== Telescope：搜索 ==========
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, vim.tbl_extend("force", opts, {
  desc = "搜索：查找项目文件"
}))

map("n", "<leader>fr", function()
  require("telescope.builtin").oldfiles()
end, vim.tbl_extend("force", opts, {
  desc = "搜索：最近打开的文件"
}))

map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, vim.tbl_extend("force", opts, {
  desc = "搜索：全文内容搜索"
}))

map("n", "<leader>bb", function()
  require("telescope.builtin").buffers()
end, vim.tbl_extend("force", opts, {
  desc = "缓冲区：列出已打开文件"
}))

vim.keymap.set("n", "<leader>cd", "<cmd>Neotree filesystem reveal left<cr>", { desc = "当前文件位置" })


-- 打开 / 显示 Neo-tree
vim.keymap.set("n", "<leader>n", function()
  require("neo-tree.command").execute({
    action = "show",
    position = "left",
  })
end, { desc = "NeoTree: 打开文件树" })

-- 关闭 Neo-tree（无条件）
vim.keymap.set("n", "<leader>N", function()
  require("neo-tree.command").execute({
    action = "close",
  })
end, { desc = "NeoTree: 关闭文件树" })

