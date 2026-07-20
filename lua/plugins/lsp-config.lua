return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "omnisharp",
          "eslint",
          "harper_ls",
          "clangd",
          "bashls"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config =  function()
      local servers = {
        "lua_ls",
        "omnisharp",
        "eslint",
        "harper_ls",
        "clangd",
        "bashls",
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {})
        vim.lsp.enable(server)
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({"n","v"}, "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
