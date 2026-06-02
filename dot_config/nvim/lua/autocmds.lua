local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Python: 4-space soft tabs
autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.expandtab   = true
    vim.opt_local.tabstop     = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth  = 4
  end,
})

-- TypeScript/JavaScript: 2-space soft tabs
autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    vim.opt_local.expandtab   = true
    vim.opt_local.tabstop     = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth  = 2
  end,
})

-- Spellcheck for markdown and git commits
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.md",
  callback = function()
    vim.opt_local.spell    = true
    vim.opt_local.spelllang = "en_us"
    vim.opt_local.complete:append("kspell")
  end,
})
autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell    = true
    vim.opt_local.spelllang = "en_us"
  end,
})

-- Jinja2 syntax
autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.jinja", "*.j2", "*.jinja2" }, command = "set filetype=jinja" })
