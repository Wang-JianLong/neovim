local M = {}

function M.env(sys)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
      local envkey = ":! g++ % -o wjl  && wjl  <CR>";
      if sys == 1 then
        envkey = ":! g++ % -o wjl  && ./wjl <CR>"
      end
      -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
      vim.keymap.set(
        "n",
        "<space>c",

        ":! g++ % -o wjl<CR> "
      -- { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>r",
        envkey
      )
    end,
  })
end

return M
