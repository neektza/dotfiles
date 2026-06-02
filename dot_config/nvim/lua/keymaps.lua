local map = vim.keymap.set

vim.g.mapleader = " "

-- remove word in insert mode
map("i", "<A-BS>", "<C-W>")

-- folding
map("n", "z<space>", "za")
map("x", "z<space>", "za")

-- window navigation handled by zellij-nav.nvim

-- tab switching
map("n", "<leader>t[", ":tabprev<cr>")
map("n", "<leader>t]", ":tabnext<cr>")

-- harpoon
map("n", "<leader>a",  function() require("harpoon"):list():add() end)
map("n", "<C-e>",      function() local h = require("harpoon"); h.ui:toggle_quick_menu(h:list()) end)
map("n", "<leader>1",  function() require("harpoon"):list():select(1) end)
map("n", "<leader>2",  function() require("harpoon"):list():select(2) end)
map("n", "<leader>3",  function() require("harpoon"):list():select(3) end)
map("n", "<leader>4",  function() require("harpoon"):list():select(4) end)

-- splits
map("n", "<leader>_",  ":split<cr>")
map("n", "<leader>|",  ":vsplit<cr>")
map("n", "<leader>,",  ":noh<cr>")

-- save
map("n", "<leader>w", ":w<cr>")

-- format
map("n", "<leader>F", function() require("conform").format({ async = true, lsp_fallback = true }) end)

-- edit config
map("n", "<leader>ev", ":e $MYVIMRC<cr>")

-- search with very magic by default
map("n", "/", "/\\v")
map("v", "/", "/\\v")

-- git (neogit)
map("n", "<leader>gs", ":Neogit<cr>")
map("n", "<leader>gc", ":Neogit commit<cr>")

-- telescope (replaces CtrlP)
map("n", "<leader>f", ":Telescope find_files<cr>")
map("n", "<leader>m", ":Telescope oldfiles<cr>")
map("n", "<leader>b", ":Telescope buffers<cr>")
map("n", "<leader>t", ":Telescope tags<cr>")
map("n", "<leader>/", ":Telescope live_grep<cr>")
map("n", "<leader>p", ":Telescope commands<cr>")

-- telescope LSP
map("n", "gd",         ":Telescope lsp_definitions<cr>")
map("n", "gr",         ":Telescope lsp_references<cr>")
map("n", "gi",         ":Telescope lsp_implementations<cr>")
map("n", "<leader>s",  ":Telescope lsp_document_symbols<cr>")
map("n", "<leader>S",  ":Telescope lsp_workspace_symbols<cr>")
map("n", "<leader>d",  ":Telescope diagnostics<cr>")

-- nvim-tree (replaces NERDTree)
map("n", "<F1>", ":NvimTreeToggle<cr>")
map("i", "<F1>", "<esc>:NvimTreeToggle<cr>")

-- EOL chars toggle
map("n", "<F3>", ":set list!<cr>")
map("n", "<F4>", ":set nolist wrap!<cr>")

-- trailing whitespace removal
map("n", "<F8>", ":%s/\\s\\+$//<cr>")

-- navigate wrapped lines naturally
map("n", "j", "gj")
map("n", "k", "gk")

-- faster line start/end
map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "$")
