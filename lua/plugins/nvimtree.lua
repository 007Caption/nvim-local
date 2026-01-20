-- lua/plugins/nvimtree.lua
-- 文件目录树：浏览工程结构
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- ⭐ 必须：文件图标
  },
  config = function()
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,

      view = {
        width = 30,
        side = "left",
      },

      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,   -- git 状态图标
          },
        },
      },

      git = {
        enable = true,
      },
    })
  end,
}

