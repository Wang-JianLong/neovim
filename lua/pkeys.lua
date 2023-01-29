local map = vim.keymap.set

-- tree
map('n', '<space>e', ':NvimTreeToggle<CR>')

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
