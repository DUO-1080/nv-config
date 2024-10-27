require "nvchad.mappings"

-- add yours here

-- map("n", "[b", "<cmd>bprevious<CR>", {desc = "previous buffer"})
-- map("n", "]b", "<cmd>bnext<CR>", {desc = "next buffer"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<leader>b")
-- nomap("n", "<leader>wa")
-- nomap("n", "<leader>wr")
-- nomap("n", "<leader>wl")
-- nomap("n", "<leader>wk")
-- nomap("n", "<leader>wK")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write buffer" })
map("n", "<Leader>wa", "<cmd>wa<CR>zt", { desc = "Save all" })
map("n", "<S-CR>", "o<c-g>u", { desc = "Next line" })
map("n", "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Togger Term" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down" })

map("i", "<C-\\>", "<ESC><cmd>ToggleTerm<cr>", { desc = "open term" })
map("i", "<S-CR>", "<ESC>o<c-g>u", { desc = "Next Line" })
map("i", "<C-CR>", "<ESC>$a", { desc = "Move cursor to line end" })
map("i", "<CR>", "<c-g>u<cr>", { desc = "Next Line" })
map("i", "<C-S-CR>", "<ESC>$a;<c-g>u<ESC>zt", { desc = "Auto Complete Statement" })
map("i", "<A-j>", "<ESC>:m .+1<CR>==", { desc = "Move Line Up" })
map("i", "<A-k>", "<ESC>:m .-2<CR>==", { desc = "Move Line Down" })

map("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

map("n", "<leader>fc", "<cmd>Telescope neoclip<CR>", { desc = "Clipboard" })
map("n", "<leader>fg", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git Status" })

map("v", "<leader>cc", "<cmd>CodeSnap<CR>")
map("v", "<leader>cs", "<cmd>CodeSnapSave<CR>")

-- nvim tree
map("n", "<leader>o", function()
    local api = require "nvim-tree.api"
    if vim.bo.filetype == "NvimTree" then
        vim.cmd.wincmd "p"
    else
        api.tree.open()
    end
end, { desc = "Toggle Explorer Focus" })

map("n", "<leader>e", function()
    local api = require "nvim-tree.api"
    api.tree.toggle()
end, { desc = "Toggle NvimTree" })

-- Standard Operations
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move cursor down" })
map("x", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move cursor up" })
map("x", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Save" })
map("n", "<Leader>q", "<Cmd>confirm q<CR>", { desc = "Quit Window" })
map("n", "<Leader>Q", "<Cmd>confirm qall<CR>", { desc = "Exit neovim" })
map("n", "<Leader>n", "<Cmd>enew<CR>", { desc = "New File" })
map("n", "<C-S>", "<Cmd>silent! update! | redraw<CR>", { desc = "Force write" })
map("i", "<C-S>", "<Esc><Cmd>silent! update! | redraw<CR>", { desc = "Force write" })
map("n", "<C-Q>", "<Cmd>q!<CR>", { desc = "Force quit" })
map("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "\\", "<Cmd>split<CR>", { desc = "Horizontal Split" })

-- Toggle comment line
map("n", "<Leader>/", "gcc", { remap = true, desc = "Toggle comment line" })
map("x", "<Leader>/", "gc", { remap = true, desc = "Toggle comment" })
map("n", "<Leader>xq", "<Cmd>copen<CR>", { desc = "Quickfix List" })
map("n", "<Leader>xl", "<Cmd>lopen<CR>", { desc = "Location List" })

-- Neovim Default LSP Mappings
map("n", "gra", function()
    vim.lsp.buf.code_action()
end, { desc = "vim.lsp.buf.code_action()" })

map("x", "gra", function()
    vim.lsp.buf.code_action()
end, { desc = "vim.lsp.buf.code_action()" })

map("n", "grn", function()
    vim.lsp.buf.rename()
end, { desc = "vim.lsp.buf.rename()" })

map("n", "grr", function()
    vim.lsp.buf.references()
end, { desc = "vim.lsp.buf.references()" })

-- Plugin Manager
map("n", "<Leader>pi", function()
    require("lazy").install()
end, { desc = "Plugins Install" })

map("n", "<Leader>ps", function()
    require("lazy").home()
end, { desc = "Plugins Status" })

map("n", "<Leader>pS", function()
    require("lazy").sync()
end, { desc = "Plugins Sync" })

map("n", "<Leader>pu", function()
    require("lazy").check()
end, { desc = "Plugins Check Updates" })

map("n", "<Leader>pU", function()
    require("lazy").update()
end, { desc = "Plugins Update" })

map("n", "<Leader>pa", function()
    require("lazy").update()
end, { desc = "Plugins Update" })
-- map("n", "<Leadedsr>pa", function() require("astrocore").update_packages() end, { desc = "Update Lazy and Mason" })

-- Manage Buffers
map("n", "<Leader>c", "<cmd>bdelete<CR>", { desc = "Close buffer" })
map("n", "<Leader>C", "<cmd>bd!<CR>", { desc = "Close buffer" })
map("n", "[b", "<cmd>bprevious<CR>", { desc = "previous buffer" })
map("n", "]b", "<cmd>bnext<CR>", { desc = "next buffer" })
-- map("n", "<Leader>C", function() require("astrocore.buffer").close(0, true) end, { desc = "Force close buffer" })
-- map("n", "]b", function() require("astrocore.buffer").nav(vim.v.count1) end, { desc = "Next buffer" })
-- map("n", "[b", function() require("astrocore.buffer").nav(-vim.v.count1) end, { desc = "Previous buffer" })
-- map("n", "<Leader>bc", function() require("astrocore.buffer").close_all(true) end, { desc = "Close all buffers except current" })
-- map("n", "<Leader>bC", function() require("astrocore.buffer").close_all() end, { desc = "Close all buffers" })
-- map("n", "<Leader>bl", function() require("astrocore.buffer").close_left() end, { desc = "Close all buffers to the left" })
-- map("n", "<Leader>bp", function() require("astrocore.buffer").prev() end, { desc = "Previous buffer" })
-- map("n", "<Leader>br", function() require("astrocore.buffer").close_right() end, { desc = "Close all buffers to the right" })
--
-- Navigation between splits and tabs
map("n", "]t", function()
    vim.cmd.tabnext()
end, { desc = "Next tab" })

map("n", "[t", function()
    vim.cmd.tabprevious()
end, { desc = "Previous tab" })

map("n", "<C-H>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-J>", "<C-w>j", { desc = "Move to below split" })
map("n", "<C-K>", "<C-w>k", { desc = "Move to above split" })
map("n", "<C-L>", "<C-w>l", { desc = "Move to right split" })

-- Resize splits
map("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Resize split up" })
map("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Resize split down" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split left" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- Quickfix and location list management
map("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<CR>", { desc = "Previous quickfix" })
map("n", "]Q", "<cmd>clast<CR>", { desc = "End quickfix" })
map("n", "[Q", "<cmd>cfirst<CR>", { desc = "Beginning quickfix" })
map("n", "]l", "<cmd>lnext<CR>", { desc = "Next loclist" })
map("n", "[l", "<cmd>lprev<CR>", { desc = "Previous loclist" })
map("n", "]L", "<cmd>llast<CR>", { desc = "End loclist" })
map("n", "[L", "<cmd>lfirst<CR>", { desc = "Beginning loclist" })

-- Diagnostics navigation
map("n", "[e", function()
    vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { desc = "Previous error" })

map("n", "]e", function()
    vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
end, { desc = "Next error" })

map("n", "[w", function()
    vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.WARN }
end, { desc = "Previous warning" })

map("n", "]w", function()
    vim.diagnostic.goto_next { severity = vim.diagnostic.severity.WARN }
end, { desc = "Next warning" })

map("n", "gl", function()
    vim.diagnostic.open_float()
end, { desc = "Hover diagnostics" })
