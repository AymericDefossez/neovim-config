local lsp_servers = {
  "angularls",
	"cssls",
	"html",
	"lua_ls",
	"ts_ls",
  "emmet_ls",
  "rust_analyzer",
  "eslint",
}

local mason_config = {
  ui = {
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "",
    },
  },
}

local function mason_lspconfig_config(lspconfig, capabilities)
  return {
    ensure_installed = lsp_servers,
    automatic_installation = true,
    handlers = {
      function(servername)
        lspconfig[servername].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              },
            },
          },
        })
      end,
      ["angularls"] = function()
        local util = require("lspconfig.util")
        local root = util.root_pattern("angular.json")(vim.fn.getcwd())
        if root then
        local function create_cmd(root_dir)
          local ts_probe_location = vim.fs.joinpath(root_dir, "node_modules")
          local ng_probe_location = ts_probe_location

          local lsp_package_path = vim.fs.joinpath(ts_probe_location, "@angular", "language-service")
          local local_lsp_is_installed = vim.fn.isdirectory(lsp_package_path) == 1

          if not local_lsp_is_installed then
            local ok, mason_registry = pcall(require, "mason-registry")
            if not ok then
              vim.notify("mason-registry could not be loaded")
              return {}
            end
            local angularls_path = vim.fs.joinpath(mason_registry.get_package("angular-language-server"):get_install_path(), "node_modules")
            ts_probe_location = angularls_path
            ng_probe_location = vim.fs.joinpath(angularls_path, "@angular", "language-server")
            local ngserver_bin = vim.fs.joinpath(angularls_path, "@angular", "language-server", "bin", "ngserver")
            return { ngserver_bin, "--stdio", "--tsProbeLocations", ts_probe_location, "--ngProbeLocations", ng_probe_location }
          end

          return { "npx", "ngserver", "--stdio", "--tsProbeLocations", ts_probe_location, "--ngProbeLocations", ng_probe_location }
        end

        require("lspconfig").angularls.setup({
          capabilities = capabilities,
          cmd = create_cmd(root),
          on_new_config = function(new_config, new_root_dir)
            new_config.cmd = create_cmd(new_root_dir)
          end,
          filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
          root_dir = root,
        })
        end
      end,
    }
  }
end

-- local function mason_lspconfig_config(lspconfig, capabilities)
--   return {
--     ensure_installed = lsp_servers,
--     automatic_installation = true,
--     handlers = {
--       function(servername)
--         lspconfig[servername].setup({
--           capabilities = capabilities,
--         })
--       end,
--       ["lua_ls"] = function()
--         lspconfig.lua_ls.setup({
--           capabilities = capabilities,
--           settings = {
--             Lua = {
--               diagnostics = {
--                 globals = { "vim" }
--               },
--             },
--           },
--         })
--       end,
--       ["angularls"] = function()
--         local util = require("lspconfig.util")
--         local cwd = vim.fn.getcwd()
--         local root = util.root_pattern("angular.json")(cwd)
--
--         if not root then
--           return
--         end
--
--         local function create_cmd(root_dir)
--           local ts_probe_location = vim.fs.joinpath(root_dir, "node_modules")
--           local ng_probe_location = ts_probe_location
--
--           local lsp_package_path = vim.fs.joinpath(ts_probe_location, "@angular", "language-service")
--           local local_lsp_is_installed = vim.fn.isdirectory(lsp_package_path) == 1
--
--           if not local_lsp_is_installed then
--             local ok, mason_registry = pcall(require, "mason-registry")
--             if not ok then
--               vim.notify("mason-registry could not be loaded")
--               return {}
--             end
--             local angularls_path = vim.fs.joinpath(mason_registry.get_package("angular-language-server"):get_install_path(), "node_modules")
--             ts_probe_location = angularls_path
--             ng_probe_location = vim.fs.joinpath(angularls_path, "@angular", "language-server")
--             local ngserver_bin = vim.fs.joinpath(angularls_path, "@angular", "language-server", "bin", "ngserver")
--             return { ngserver_bin, "--stdio", "--tsProbeLocations", ts_probe_location, "--ngProbeLocations", ng_probe_location }
--           end
--
--           return { "npx", "ngserver", "--stdio", "--tsProbeLocations", ts_probe_location, "--ngProbeLocations", ng_probe_location }
--         end
--
--         require("lspconfig").angularls.setup({
--           capabilities = capabilities,
--           cmd = create_cmd(root),
--           on_new_config = function(new_config, new_root_dir)
--             new_config.cmd = create_cmd(new_root_dir)
--           end,
--           filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
--           root_dir = root,
--         })
--       end
--     }
--   }
-- end

return {
  mason_config = mason_config,
  mason_lspconfig_config = mason_lspconfig_config,
}
