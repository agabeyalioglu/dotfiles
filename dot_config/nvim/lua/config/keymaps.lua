local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", { silent = true })
map("n", "<C-Down>", ":resize -2<CR>", { silent = true })
map("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { silent = true, desc = "Prev buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { silent = true, desc = "Delete buffer" })

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Stay centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better paste (don't overwrite register)
map("x", "<leader>p", '"_dP', { desc = "Paste without overwrite" })

-- Quick save/quit
map("n", "<leader>w", ":w<CR>", { silent = true, desc = "Save" })
map("n", "<leader>q", ":q<CR>", { silent = true, desc = "Quit" })

-- Clear search
map("n", "<Esc>", ":noh<CR>", { silent = true })

-- Diagnostic navigation
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic float" })
