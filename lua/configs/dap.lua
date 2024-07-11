local dap = require("dap")
local dapui = require("dapui")

local codelldb = require("mason-registry").get_package('codelldb'):get_install_path() .. '/extension'

dap.adapters.codelldb = {
  type = "server",
  host = "127.0.0.1",
  port = "13000",
  executable = {
    command = codelldb .. '/adapter/codelldb',
    args = {
      "--port", "13000"
    }
  }
}

dap.configurations.rust = {
  type = 'codelldb',
  request = 'launch',
  program = function ()
    error("Use :RustLsp bro")
    return dap.ABORT
  end,
  terminal = 'integrated',
  sourceLanguages = { 'rust'},
  showDisassembly = "never"
}

vim.keymap.set("n", '<Leader>db', dap.toggle_breakpoint, {})
vim.keymap.set("n", '<Leader>dc', dap.continue, {})

dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
