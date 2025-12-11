return {
 cmd = { "typescript-language-server", "--stdio" }, -- Native 0.11 Root Detection
  -- Looks for these files to decide if it should start, and where the project root is.
  root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },

  -- Optimized settings for TypeScript
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      suggest = {
        completeFunctionCalls = true, -- Auto-completes () after functions
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
  },
  
  -- Optional: Enable Inlay Hints when the server attaches
  -- (Neovim 0.10+ supports them natively, but they are often hidden by default)
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,

    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
}
