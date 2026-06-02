-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({


  -- ── colours ────────────────────────────────────────────────────────────
  -- gruvbox handles dark/light via vim.o.background (matches ghostty + zellij)
  {
    "ellisonleao/gruvbox.nvim",
    name     = "gruvbox",
    priority = 1000,
    config   = function()
      require("theme").apply()
      vim.api.nvim_create_autocmd("OptionSet", { pattern = "background", callback = require("theme").apply })
    end,
  },

  -- ── status line (replaces vim-airline) ─────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
    },
  },

  -- ── file finder (replaces CtrlP) ───────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = { "_build", "deps", "node_modules", ".git" },
      },
    },
  },

  -- ── file tree (replaces NERDTree) ──────────────────────────────────────
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      filters   = { dotfiles = false },
      renderer  = { highlight_git = true },
      sync_root_with_cwd = true,
      respect_buf_cwd    = true,
      update_focused_file = {
        enable    = true,
        update_root = true,
      },
    },
  },

  -- ── yank history (replaces yankring) ───────────────────────────────────
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({})
      vim.keymap.set({ "n", "x" }, "p",  "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P",  "<Plug>(YankyPutBefore)")
      vim.keymap.set("n", "<leader>y", ":Telescope yank_history<cr>")
    end,
  },

  -- ── comments (replaces vim-commentary) ─────────────────────────────────
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- ── surround (replaces vim-surround) ───────────────────────────────────
  {
    "kylechui/nvim-surround",
    version = "*",
    event   = "VeryLazy",
    opts    = {},
  },

  -- ── rainbow brackets (replaces rainbow_parentheses.vim) ────────────────
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rd = require("rainbow-delimiters")
      require("rainbow-delimiters.setup").setup({
        strategy = { [""] = rd.strategy["global"] },
        query    = { [""] = "rainbow-delimiters" },
      })
    end,
  },

  -- ── treesitter: syntax + elixir + graphql ──────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    build  = ":TSUpdate",
    event  = { "BufReadPost", "BufNewFile" },
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then return end
      configs.setup({
        ensure_installed = {
          "lua", "vim", "vimdoc",
          "python",
          "typescript", "tsx", "javascript",
          "graphql",
          "ruby",
          "terraform", "hcl",
          "markdown", "yaml", "json",
          "html", "css",
        },
        highlight    = { enable = true },
        indent       = { enable = true },
        auto_install = true,
      })
    end,
  },

  -- ── alignment (same as tabular) ────────────────────────────────────────
  { "godlygeek/tabular" },

  -- ── tpope classics (all work unchanged in nvim) ────────────────────────
  { "tpope/vim-fugitive"     },
  { "tpope/vim-repeat"       },
  { "tpope/vim-dispatch"     },
  { "tpope/vim-liquid"       },
  { "tpope/vim-projectionist"},
  { "tpope/vim-endwise"      },
  { "tpope/vim-obsession"    },

  -- ── textobj (still useful even without ruby) ───────────────────────────
  { "kana/vim-textobj-user"        },
  { "nelstrom/vim-textobj-rubyblock", dependencies = { "kana/vim-textobj-user" } },

  -- ── terraform ──────────────────────────────────────────────────────────
  { "hashivim/vim-terraform" },

  -- ── scrollbar (the whole reason we started this) ───────────────────────
  {
    "dstein64/nvim-scrollview",
    config = function()
      vim.g.scrollview_side = "right"
    end,
  },

  -- ── zellij pane navigation ──────────────────────────────────────────────
  {
    "swaits/zellij-nav.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- ── LSP ────────────────────────────────────────────────────────────────
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Python
      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.enable("pyright")

      -- TypeScript / JavaScript
      vim.lsp.config("ts_ls", { capabilities = capabilities })
      vim.lsp.enable("ts_ls")

      -- keymaps (only active when LSP is attached to buffer)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(keys, func) vim.keymap.set("n", keys, func, { buffer = args.buf }) end
          map("K",          vim.lsp.buf.hover)
          map("gD",         vim.lsp.buf.declaration)
          map("<leader>rn", vim.lsp.buf.rename)
          map("<leader>ca", vim.lsp.buf.code_action)
          map("<leader>e",  vim.diagnostic.open_float)
          map("[d",         vim.diagnostic.goto_prev)
          map("]d",         vim.diagnostic.goto_next)
        end,
      })

      -- completion
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },

}, {
  -- lazy.nvim ui settings
  ui = { border = "rounded" },
  git = {
    -- rewrite all github HTTPS URLs to SSH (HTTPS auth is broken on this host)
    url_format = "git@github.com:%s.git",
  },
})
