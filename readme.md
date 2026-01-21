# Neovim 配置说明（Go）

本文件是当前 Neovim 配置
---

## 一、基本约定

- 插件管理器：lazy.nvim
- Leader 键：`,`（逗号）
- Which-key 触发键：`,,`（两个逗号，仅用于显示菜单）
- 字体：JetBrainsMono Nerd Font
- 当前主线：Go 开发 + 通用编辑
- 已明确不用：
  - neotest
  - treesitter

---

## 二、插件总览（已安装）

### 插件管理
- folke/lazy.nvim  
  插件安装、更新、懒加载管理

命令：
- `:Lazy` 打开插件管理界面

---

### LSP（代码智能）
- neovim/nvim-lspconfig
- williamboman/mason.nvim
- williamboman/mason-lspconfig.nvim

用途：
- 跳转定义 / 引用
- Hover 文档
- 重命名
- Code Action

Go 使用：
- gopls

---

### 补全
- hrsh7th/nvim-cmp
- hrsh7th/cmp-nvim-lsp
- L3MON4D3/LuaSnip
- saadparwaiz1/cmp_luasnip

---

### 格式化
- stevearc/conform.nvim

Go 常用：
- gofmt
- goimports（如已配置）

---

### 查找 / 导航
- nvim-telescope/telescope.nvim
- nvim-lua/plenary.nvim
- nvim-tree/nvim-tree.lua
- nvim-tree/nvim-web-devicons

---

### Git
- lewis6991/gitsigns.nvim

---

### UI
- nvim-lualine/lualine.nvim
- folke/which-key.nvim

---

### 编辑增强
- numToStr/Comment.nvim
- windwp/nvim-autopairs

---

## 三、快捷键全集

### Leader 规则
- Leader：`,`
- Which-key：`,,`

---

### 基础操作
| 快捷键 | 功能 |
|------|------|
| `,w` | 保存文件 |
| `,q` | 退出窗口 |
| `,h` | 取消搜索高亮 |
| `J`  | 合并下一行但保持光标位置 |

---

### 窗口管理
| 快捷键 | 功能 |
|------|------|
| `,sv` | 垂直分屏 |
| `,sh` | 水平分屏 |
| `,sc` | 关闭当前窗口 |

---

### LSP（代码导航）
| 快捷键 | 功能 |
|------|------|
| `,gd` | 跳转定义 |
| `,gi` | 跳转实现 |
| `,gt` | 跳转类型定义 |
| `,gr` | 查引用 |
| `,k`  | Hover 文档 |
| `,rn` | 重命名 |
| `,ca` | Code Action |

---

### NvimTree（目录树）
| 快捷键 | 功能 |
|------|------|
| `,n` | 打开/关闭目录树 |
| `,f` | 在目录树中定位当前文件 |

目录树内操作：
- `j / k`：上下移动
- `Enter / l`：打开
- `h`：收起
- `a`：新建文件
- `r`：重命名
- `d`：删除

---

### Telescope（模糊查找）
| 快捷键 | 功能 |
|------|------|
| `,ff` | 查找文件 |
| `,fr` | 最近文件 |
| `,fg` | 全文搜索 |
| `,bb` | Buffer 列表 |

Picker 内操作：
- `Ctrl+j`：下一个
- `Ctrl+k`：上一个
- `Ctrl+v`：垂直分屏打开
- `Ctrl+s`：水平分屏打开
- `Enter`：当前窗口打开

---

### Git（gitsigns）
| 快捷键 | 功能 |
|------|------|
| `]h` | 下一个 hunk |
| `[h` | 上一个 hunk |
| `,gp` | 预览 hunk |
| `,gs` | 暂存 hunk |
| `,gS` | 暂存整个文件 |
| `,gu` | 撤销暂存 |
| `,gb` | 查看当前行 blame |
| `,gB` | 切换 inline blame |

说明：
- `,gr` 已保留给 LSP 引用，不再用于 git reset，避免冲突

---

### 注释（Comment.nvim）
| 操作 | 功能 |
|----|----|
| `gcc` | 注释当前行 |
| `gc`（可视模式） | 注释选中代码块 |

---

### 自动括号
- 输入 `{ ( [ ' "` 自动补全
- 删除时成对删除

---

### Which-key
| 快捷键 | 功能 |
|------|------|
| `,,` | 显示 Leader 快捷键菜单 |

---

## 四、Go 测试（当前主线）

当前不使用 neotest，统一使用 Go 原生命令：

```bash
# 当前包
go test .

# 指定子包
go test ./logic

# 全项目（慎用）
go test ./...

