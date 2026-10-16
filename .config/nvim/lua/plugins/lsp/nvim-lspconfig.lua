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
      if client.name == "ruff" or client.name == "nixd" then
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
      "rumdl",
      "rust_analyzer",
      "taplo",
      "terraformls",
      "ts_ls",
      "yamlls",
      "zuban",
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

    -- nixd: completion for NixOS / home-manager options (hostname == flake host)
    local flake = vim.fn.expand("~/dotfiles/.config/nixos")
    local host = vim.fn.hostname()
    vim.lsp.config["nixd"] = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      settings = {
        nixd = {
          formatting = { command = { "nixfmt" } },
          options = {
            nixos = {
              expr = string.format('(builtins.getFlake "%s").nixosConfigurations.%s.options', flake, host),
            },
            ["home-manager"] = {
              expr = string.format(
                '(builtins.getFlake "%s").nixosConfigurations.%s.options.home-manager.users.type.getSubOptions []',
                flake,
                host
              ),
            },
          },
        },
      },
    }

    -- Enable all configured LSP servers
    local all_servers = vim.list_extend(servers, { "lua_ls", "jsonls", "nil_ls", "nixd" })
    vim.lsp.enable(all_servers)
  end,
}
