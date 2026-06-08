local M = {}

function M.apply()
  require("gruvbox").setup({ transparent_mode = true })
  vim.cmd.colorscheme("gruvbox")
end

return M
