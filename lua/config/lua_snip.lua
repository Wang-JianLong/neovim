vim.cmd [[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']]
vim.cmd [[inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>]]
vim.cmd [[snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>]]
vim.cmd [[snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>]]
vim.cmd [[imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']]
vim.cmd [[smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']]

-- specify the full path...
require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })