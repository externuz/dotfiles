require('base')
require('keymaps')

if vim.g.vscode then
  -- VSCode extension
else
  require('plugins')
end

