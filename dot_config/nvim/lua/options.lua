local opt = vim.opt

-- encoding
opt.encoding = "utf-8"

-- indentation (default 4 wide hard tabs, ruby overrides to 2 soft)
opt.smarttab     = false
opt.expandtab    = false
opt.tabstop      = 4
opt.shiftwidth   = 4
opt.softtabstop  = 4
opt.autoindent   = true
opt.fileformats  = { "unix", "dos" }

-- search
opt.ignorecase = true
opt.smartcase  = true
opt.incsearch  = true
opt.showmatch  = true
opt.hlsearch   = true

-- ui
opt.number         = true
opt.relativenumber = false
opt.cursorline     = false
opt.showmode       = true
opt.showcmd        = true
opt.ruler          = true
opt.laststatus     = 2
opt.scrolloff      = 10
opt.signcolumn     = "yes"
opt.termguicolors  = true

-- behaviour
opt.hidden     = true
opt.modelines  = 0
opt.compatible = false
opt.mouse      = "a"
opt.backspace  = { "indent", "eol", "start" }
-- macOS uses the native clipboard provider (pbcopy/pbpaste).
-- On the VPS, copy via OSC 52 but paste from the last local copy/delete.
-- Clipboard reads can time out through SSH/multiplexers; Cmd+V still pastes
-- external clipboard text through the terminal without an OSC 52 query.
if vim.fn.has("macunix") == 0 then
  local osc52 = require("vim.ui.clipboard.osc52")
  local contents = { ["+"] = { {}, "v" }, ["*"] = { {}, "v" } }
  local copy, paste = {}, {}
  for _, reg in ipairs({ "+", "*" }) do
    local send = osc52.copy(reg)
    copy[reg] = function(lines, regtype)
      contents[reg] = { vim.deepcopy(lines), regtype }
      send(lines)
    end
    paste[reg] = function()
      return vim.deepcopy(contents[reg])
    end
  end
  vim.g.clipboard = {
    name = "OSC 52 (copy only)",
    copy = copy,
    paste = paste,
  }
end
opt.clipboard = "unnamedplus"

-- wildmenu
opt.wildmenu = true
opt.wildmode = "list:longest"
opt.wildignore:append { "*/target/*", "*/_build/*", "*/tmp/*", "*.so", "*.swp", "*.zip", "*.log", ".DS_Store" }

-- wrapping
opt.wrap        = false
opt.linebreak   = true
opt.formatoptions = "qrn1"

-- folding
opt.foldmethod = "manual"

-- swap / backup / undo
opt.swapfile   = false
opt.backup     = false
opt.writebackup = false
opt.undofile   = true
opt.undodir    = vim.fn.expand("~/.config/nvim/tmp/undo//")

-- misc
opt.visualbell = true
opt.ttyfast    = true  -- no-op in nvim but harmless
opt.iskeyword:append("_")

-- make undo dir if missing
vim.fn.mkdir(vim.fn.expand("~/.config/nvim/tmp/undo"), "p")
