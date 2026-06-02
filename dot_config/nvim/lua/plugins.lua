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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "_build", "deps", "node_modules", ".git" },
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },

  -- ── fzf sorter for telescope (requires make + gcc) ──────────────────────
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
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

  -- ── treesitter: syntax + indentation ────────────────────────────────────
  -- Using main branch (master archived Apr 2026) + treesitter-modules.nvim
  -- which restores ensure_installed, highlight, indent APIs.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build  = ":TSUpdate",
    lazy   = false,
    dependencies = {
      "MeanderingProgrammer/treesitter-modules.nvim",
    },
    config = function()
      require("treesitter-modules").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc",
          "python",
          "typescript", "tsx", "javascript",
          "graphql",
          "ruby",
          "terraform", "hcl",
          "markdown", "markdown_inline", "yaml", "json",
          "html", "css", "sql",
        },
        sync_install  = false,
        auto_install  = true,
        highlight     = { enable = true },
        indent        = { enable = true },
      })
    end,
  },

  -- ── alignment (same as tabular) ────────────────────────────────────────
  { "godlygeek/tabular" },

  -- ── git ────────────────────────────────────────────────────────────────
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { graph_style = "unicode" },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(keys, func) vim.keymap.set("n", keys, func, { buffer = bufnr }) end
        map("<leader>hp", gs.preview_hunk)
        map("<leader>hb", gs.blame_line)
        map("]h",         gs.next_hunk)
        map("[h",         gs.prev_hunk)
        map("<leader>hs", gs.stage_hunk)
        map("<leader>hr", gs.reset_hunk)
      end,
    },
  },

  -- ── tpope classics (all work unchanged in nvim) ────────────────────────
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

  -- ── conform: formatting ─────────────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python     = { "ruff_format" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          markdown   = { "prettierd" },
          sql        = { "sql_formatter" },
          lua        = { "stylua" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },

  -- ── flash: fast motions/jumping ─────────────────────────────────────────
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
    },
  },

  -- ── harpoon: fast file switching ────────────────────────────────────────
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- ── which-key: keybind hints ────────────────────────────────────────────
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- ── zellij pane navigation ──────────────────────────────────────────────
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left"  } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
      { "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
    },
    opts = {},
  },

  -- ── Mason: LSP server manager ───────────────────────────────────────────
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "pyright", "ts_ls", "marksman" },
      automatic_enable = true,
    },
  },

  -- ── mason-tool-installer: auto-install formatters/linters ───────────────
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "sql-formatter",
      },
      auto_update = false,
      run_on_start = true,
    },
  },

  -- ── LSP + completion ─────────────────────────────────────────────────────
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Set capabilities globally — mason-lspconfig's automatic_enable picks this up
      -- for every server it enables, so no explicit per-server config needed.
      vim.lsp.config("*", { capabilities = capabilities })

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
