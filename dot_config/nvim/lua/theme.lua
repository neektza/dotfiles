local M = {}

function M.apply()
  require("gruvbox").setup({ transparent_mode = false })
  vim.cmd.colorscheme("gruvbox")
end

return M
