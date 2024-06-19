return {
	"neovim/nvim-lspconfig",
	event = "VimEnter",
	config = function()
		local nv_conf = require "opts.lspconf"
		nv_conf.servers.html = {}
		nv_conf.servers.cssls = {}
		nv_conf.servers.marksman = {}
		nv_conf.servers.intelephense = {}
		nv_conf.setup()
		-- local lspconfig = require "lspconfig"
		-- local servers = { "html", "cssls" }
		--
		-- -- lsps with default config
		-- for _, lsp in ipairs(servers) do
		-- 	lspconfig[lsp].setup {
		-- 		on_attach = nv_conf.on_attach,
		-- 		on_init = nv_conf.on_init,
		-- 		capabilities = nv_conf.capabilities,
		-- 	}
		-- end
	end,
}

