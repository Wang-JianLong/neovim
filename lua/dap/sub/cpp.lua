-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)

local dap = require('dap')

local CppDap = {}

function CppDap.start(os)
  if os then
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = 'D:/Download/Files/cpptools-win64/extension/debugAdapters/bin/OpenDebugAD7.exe',
    }
  else
    local dap = require('dap')
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = 'D:/Download/Files/cpptools-win64/extension/debugAdapters/bin/OpenDebugAD7.exe',
      options = {
        detached = false
      }
    }
  end
end

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

return CppDap
