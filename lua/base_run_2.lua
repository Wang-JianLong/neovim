local Run = {
  keys = {
    c_k = '<leader>c', -- complie
    r_k = '<leader>r', -- complie and run
    t_k = '<leader>ur', -- terminal run
  },

  codes = {
    java = {
      name = 'java',
      is_complie = true,
      cmd = {
        complie = {
          name = 'javac',
          argv = {
          }
        },
        run = {
          name = 'java',
          argv = {
          }
        },
      },
      keys = {
        mode = 'n'
      }
    },

    cpp = {
      name = 'cpp';
      is_complie = true,
      cmd = {
        complie = {
          name = 'g++',
          argv = {
            ['-o'] = 'wjl',
          }
        },
        run = {
          name = 'wjl',
          args = {
          }
        },
      },
      keys = {
        mode = 'n'
      }
    }
  }
}

local initkey = function(code)
  if not code.keys.c_k then
    code.keys.c_k = Run.keys.c_k
  end
  if not code.keys.r_k then
    code.keys.r_k = Run.keys.r_k
  end
  if not code.keys.t_k then
    code.keys.t_k = Run.keys.t_k
  end
end

local map = vim.keymap.set
local binding = function(os)
  for _, code in pairs(Run.codes) do
    initkey(code)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = code.name,
      callback = function()
        -- 编译
        local mode = code.keys.mode
        if (code.is_complie) then
          local complie_argv = ''
          if (code.cmd.complie.argv) then
            for k, v in pairs(code.cmd.complie.argv) do
              complie_argv = complie_argv .. ' ' .. k .. ' ' .. v
            end
          end
          local costr = ':!' .. code.cmd.complie.name .. ' % ' .. complie_argv .. '<CR>'
          map(mode, code.keys.c_k, costr)

        end


      end;
    })

  end
end

local M = {

};

print('run--2')
for _, code in pairs(Run.codes) do
  initkey(code)
  local mode = code.keys.mode

  if (code.is_complie and code.cmd.complie.argv) then
    local complie_argv = ' '
    for k, v in pairs(code.cmd.complie.argv) do
      -- complie_argv = complie_argv .. ' ' .. k .. ' ' .. v

      complie_argv = complie_argv .. ' ' .. k .. ' ' .. v
    end
    local costr = ':!' .. code.cmd.complie.name .. ' % ' .. complie_argv .. '<CR>'

    print(costr)
  end
end
