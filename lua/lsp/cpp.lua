local M = {}

function M.env(sys)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
      local envkey = ":w :! g++ % -o wjl  && wjl  <CR>";
      local tenvkey = ":terminal g++ % -o wjl && wjl<CR>i"
      if sys == 1 then
        tenvkey = ":terminal g++ % -o wjl && ./wjl<CR>i"
        envkey = ":w :! g++ % -o wjl  && ./wjl <CR>"
      end
      -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
      vim.keymap.set(
        "n",
        "<space>c",
        ":w :! g++ % -o wjl<CR> "
      -- { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>r",
        envkey
      )
      vim.keymap.set(
        "n",
        "<space>ur",
        tenvkey
      )
    end,
  })
end

return M
