require("nvim-tree").setup {
    filters = {
        dotfiles = false, -- 是否隐藏点文件（包括 .git）
        custom = { ".git" }, -- 自定义隐藏文件
    },
    -- 其他配置项...
}
