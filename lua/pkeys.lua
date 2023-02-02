local map = vim.keymap.set

-- tree
map('n', ';e', ':NvimTreeToggle<CR>')

vim.keymap.set(
  "n",
  "<leader><space>", -- <space><space>
  "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})




map('n', '<space>te', ':ToggleTerm size=10<CR>')

-- BufferLine
map('n', '<A-[>', ':BufferLineGoToBuffer 1<CR>')
map('n', '<A-]>', ':BufferLineGoToBuffer -1<CR>')
map('n', 'xb', ':BufferLinePickClose<CR>')

-- bookmark
--[[
Add/remove bookmark at current line 	mm 	:BookmarkToggle
Add/edit/remove annotation at current line 	mi 	:BookmarkAnnotate <TEXT>
Jump to next bookmark in buffer 	mn 	:BookmarkNext
Jump to previous bookmark in buffer 	mp 	:BookmarkPrev
Show all bookmarks (toggle) 	ma 	:BookmarkShowAll
Clear bookmarks in current buffer only 	mc 	:BookmarkClear
Clear bookmarks in all buffers 	mx 	:BookmarkClearAll
Move up bookmark at current line 	[count]mkk 	:BookmarkMoveUp [<COUNT>]
Move down bookmark at current line 	[count]mjj 	:BookmarkMoveDown [<COUNT>]
Move bookmark at current line to another line 	[count]mg 	:BookmarkMoveToLine <LINE>
将所有书签保存到一个文件 		:BookmarkSave <FILE_PATH>
从文件加载书签 		:BookmarkLoad <FILE_PATH>
--]]
map('n', '<leader>fm', ':Telescope vim_bookmarks all<CR>', {})
map('n', '<leader>cm', ':Telescope vim_bookmarks current_file<CR>', {})



vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
-- end, { desc = "Next error/warning todo comment" })

-- dap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
