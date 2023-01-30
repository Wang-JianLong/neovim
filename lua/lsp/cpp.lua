local M = {}

function M.env(sys)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
      local envkey = "<ESC>:split<CR> :te g++ % -o wjl  && wjl <CR> ";
      if sys == 'linux' then
        envkey = "<ESC>:split<CR> :te g++ % -o wjl  && ./wjl <CR> "
      end
      -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<space>c",

        "<ESC>:split<CR> :te g++ % -o wjl<CR> ",
        { silent = true, noremap = true }
      )
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<space>r",
        envkey,
        { silent = true, noremap = true }
      )
    end,
  })
end

return M
