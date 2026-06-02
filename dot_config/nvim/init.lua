-- entry point
-- disable netrw before everything else (required by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("options")
require("keymaps")
require("plugins")   -- lazy.nvim (must come before colorscheme etc.)
require("autocmds")
require("commands")

-- syntax
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- React to OSC 11 terminal background color responses.
-- Nvim 0.11 receives them via TermResponse but doesn't auto-set vim.o.background.
vim.api.nvim_create_autocmd("TermResponse", {
  callback = function(args)
    local seq = args.data and args.data.sequence or ""
    local r, g, b = seq:match("\027%]11;rgb:(%x+)/(%x+)/(%x+)")
    if not r then return end
    -- values are 16-bit hex (e.g. "efef") — use first byte only
    local brightness = (tonumber(r:sub(1,2), 16) + tonumber(g:sub(1,2), 16) + tonumber(b:sub(1,2), 16)) / 3
    local bg = brightness > 127 and "light" or "dark"
    if vim.o.background ~= bg then
      vim.o.background = bg  -- this triggers OptionSet -> theme.apply()
    end
  end,
})
