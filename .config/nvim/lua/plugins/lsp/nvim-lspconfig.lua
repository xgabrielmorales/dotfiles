return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- LSP Config
    local M = {}

    M.on_attach = function(client, bufnr)
      if client.name == "ruff" then
        client.server_capabilities.hoverProvider = false
      end

      if client.config.root_dir then
        vim.api.nvim_set_current_dir(client.config.root_dir)
      end

      -- Local Keybindings
      local map = vim.keymap.set
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      -- Buffer
      map("n", "<M-.>", vim.lsp.buf.definition, bufopts)
      map("n", "<M-,>", function()
        vim.lsp.buf.references({ includeDeclaration = false })
      end, bufopts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      map("n", "<leader>gr", vim.lsp.buf.rename, bufopts)
      map("n", "K", function()
        vim.lsp.buf.hover({ border = "single" })
      end, bufopts)
      map("n", "<leader>cf", function()
        vim.lsp.buf.format({ async = true, timeout_ms = 3000 })
      end, bufopts)

      -- Diagnostic
      -- stylua: ignore start
      map("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1 }) end)
      map("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1 }) end)
      map("n", "<leader>df", vim.diagnostic.open_float)
      -- stylua: ignore end
    end

    M.capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.diagnostic.config({
      float = { border = "single" },
      severity_sort = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      virtual_text = false,
    })

    -- LSP Servers Configuration
    local servers = {
      "bashls",
      "docker_language_server",
      "eslint",
      "harper-ls",
      "ruff",
      "rust_analyzer",
      "taplo",
      "ts_ls",
      "yamlls",
      "ty",
    }

    for _, lsp in pairs(servers) do
      vim.lsp.config[lsp] = {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
      }
    end

    -- https://github.com/LuaLS/lua-language-server
    vim.lsp.config["lua_ls"] = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      settings = {
        Lua = {
          telemetry = { enable = false },
          diagnostics = {
            globals = { "vim", "require" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            },
          },
        },
      },
    }

    -- JsonLS
    vim.lsp.config["jsonls"] = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      init_options = {
        provideFormatter = false,
      },
    }

    -- Nix
    vim.lsp.config["nil_ls"] = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      settings = {
        ["nil"] = {
          formatting = {
            command = { "nixfmt" },
          },
        },
      },
    }
  end,
}
