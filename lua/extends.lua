require('plugins')
require('pkeys')

require('lsp.mason')
require('lsp.lsp')
require('lsp.cmp')
require('config.tree')
--require('config.bufferline')
require('config.lua_line')
require('config.text')
require('config.telescope')
require('config.term')
--require('config.vim_go')
--require('config.themes').three()
require('config.markdown')
local M = {}
function M.env(sys)
  require('lsp.cpp').env(sys)
  require('config.treesitter').langlist(sys, { 'c', 'vim', 'lua', 'help', 'rust', 'c', 'go' })
end

return M
