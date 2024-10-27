-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "everforest",

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

M.nvdash = {
    load_on_startup = true,
    header = {
        "                            ",
        "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
        "   ▄▀███▄     ▄██ █████▀    ",
        "   ██▄▀███▄   ███           ",
        "   ███  ▀███▄ ███           ",
        "   ███    ▀██ ███           ",
        "   ███      ▀ ███           ",
        "   ▀██ █████▄▀█▀▄██████▄    ",
        "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
        "                            ",
        "     Powered By  eovim    ",
        "                            ",
    },

    buttons = {
        { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
        { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
        { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
        { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
        { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

        {
            txt = function()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime) .. " ms"
                return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
            end,
            hl = "NvDashLazy",
            no_gap = true,
        },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
    },
}

M.options = {
    tabstop = 4, -- 将一个制表符宽度设置为 4 个空格
    shiftwidth = 4, -- 自动缩进时使用 4 个空格
    softtabstop = 4, -- 插入和删除时的制表符宽度
    expandtab = true, -- 将制表符替换为空格
}

local opt = vim.opt
local g = vim.g

-- vim.opt.<key> 设置
opt.relativenumber = true -- 显示相对行号
opt.number = true -- 显示行号
opt.spell = false -- 关闭拼写检查
opt.signcolumn = "yes" -- 始终显示符号列
opt.wrap = false -- 禁用自动换行
opt.scrolloff = 15 -- 滚动时保持的上下距离

-- vim.g.<key> 设置
g.mapleader = " " -- 设置空格键为 mapleader
g.autoformat_enabled = true -- 启用自动格式化
g.cmp_enabled = true -- 启用补全
g.autopairs_enabled = true -- 启用自动补全括号
g.diagnostics_mode = 3 -- 设置诊断显示模式 (0=关闭, 1=仅状态栏显示, 2=关闭虚拟文本, 3=全部显示)
g.icons_enabled = true -- 启用 UI 图标
g.ui_notifications_enabled = true -- 启用 UI 切换通知
g.resession_enabled = false -- 禁用 resession.nvim 会话管理

return M
