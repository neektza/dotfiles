-- custom commands
vim.api.nvim_create_user_command("FormatXML",  "%!xmllint --format -",       {})
vim.api.nvim_create_user_command("FormatJSON", "%!python3 -m json.tool",      {})
vim.api.nvim_create_user_command("FormatHTML", "%!tidy -q -i --show-errors 0", {})
vim.api.nvim_create_user_command("FormatYAML", "%!python3 -c \"import sys,yaml; print(yaml.dump(yaml.safe_load(sys.stdin)))\"", {})
