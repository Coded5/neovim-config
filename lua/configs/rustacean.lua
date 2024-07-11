local util = require("lspconfig/util")
local codelldb = require("mason-registry").get_package('codelldb'):get_install_path() .. '/extension'

vim.g.rustaceanvim = {
  tools = {
    float_win_config = {
      auto_focus = true
    }
  },
  server = {
    default_settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true
        }
      }
    }
  },
  dap = {
    autoload_configuration = true,
    adapter = require('rustaceanvim.config').get_codelldb_adapter(
      codelldb .. '/adapter/codelldb',
      codelldb .. '/lldb/lib/liblldb.so'
    )
  }
}
