local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
	capabilities = capabilities,
 	root_dir = lspconfig.util.root_pattern(".git", "init.lua"),
  	settings = {
    	Lua = {
      		runtime = {
        	version = "LuaJIT",
        	path = vim.split(package.path, ";"),
      	},
      	diagnostics = {
        	globals = { "vim" },
      	},
      	workspace = {
        	library = {
          		vim.env.VIMRUNTIME,
          		vim.fn.stdpath("config"),
        	},
        	checkThirdParty = false,
      	},
      	telemetry = { enable = false },
    },
  },
})


-- JS, TS
lspconfig.ts_ls.setup {}

-- HTML
lspconfig.html.setup {}

-- CSS
lspconfig.cssls.setup {}

-- JSON
lspconfig.jsonls.setup {}

-- Emmet
lspconfig.emmet_ls.setup {
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescriptreact" }
}
