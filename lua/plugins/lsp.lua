return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
					{ path = "vim/_meta", words = { "vim" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true },
	},
	config = function()
		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP specification.
		--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		---@class Server
		---@field cmd string[]? Override the default command used to start the server
		---@field filetypes string[]? Override the default list of associated filetypes for the server
		---@field capabilities lsp.ServerCapabilities? Override fields in capabilities. Can be used to disable certain LSP features.
		---@field settings table? Override the default settings passed when initializing the server.
		---	For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

		---@type {[string]:Server}
		local servers = {
			clangd = {
				cmd = { "clangd", "--clang-tidy" },
			},
			lua_ls = {
				settings = {
					Lua = {
						hint = {
							enable = true,
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		}
		for server_name, server in pairs(servers) do
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

			require("lspconfig")[server_name].setup(server)
		end
	end,
}
