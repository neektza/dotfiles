local map = vim.keymap.set

vim.g.mapleader = " "

-- remove word in insert mode
map("i", "<A-BS>", "<C-W>")

-- folding
map("n", "z<space>", "za")
map("x", "z<space>", "za")

-- window navigation handled by zellij-nav.nvim

-- tab switching
for i = 1, 5 do
  map("n", "<leader>" .. i, i .. "gt")
  map("n", "<M-" .. i .. ">", i .. "gt")
end

-- splits
map("n", "<leader>_",  ":split<cr>")
map("n", "<leader>|",  ":vsplit<cr>")
map("n", "<leader>,",  ":noh<cr>")

-- alt shortcuts
map("n", "<M-t>", ":tabnew<cr>")
map("n", "<M-w>", ":close<cr>")
map("n", "<M-s>", ":w<cr>")

-- edit config
map("n", "<leader>ev", ":e $MYVIMRC<cr>")

-- search with very magic by default
map("n", "/", "/\\v")
map("v", "/", "/\\v")

-- fugitive (git)
map("n", "<leader>gw",  ":Gwrite<cr>")
map("n", "<leader>gr",  ":Gread<cr>")
map("n", "<leader>gs",  ":Git<cr>")          -- Gstatus -> :Git in modern fugitive
map("n", "<leader>gc",  ":Git commit<cr>")
map("n", "<leader>grm", ":GRemove<cr>")
map("n", "<leader>gmv", ":GMove<cr>")

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

-- bash-like line nav
map("n", "<C-a>", "^")
map("n", "<C-e>", "$")
