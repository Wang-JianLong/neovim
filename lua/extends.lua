require('plugins')
require('pkeys')

require('lsp.mason')
require('lsp.lsp')
require('lsp.cmp')
-- require('lsp.lspsaga')
require('lsp.null_ls')

require('config.tree')
--require('config.bufferline')
require('config.lua_line')
require('config.text')
require('config.telescope')
require('config.term')
require('config.lua_snip')
--require('config.vim_go')
require('config.themes').one()
require('config.markdown')
local M = {}
function M.env(sys)
  require('base_run').is_linux(sys)
  -- require('base_run_2')
  require('config.treesitter').langlist(sys, { 'c', 'vim', 'lua', 'help', 'rust', 'c', 'go' })
end

return M
