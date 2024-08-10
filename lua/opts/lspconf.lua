-- EXAMPLE
local M = {}
-- local nv_conf = require "nvchad.configs.lspconfig"

lspconf = require("lspconfig")

M.servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						[vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
						[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
			},
		},
	},
}
M.mapping = {
	n = {
		["gD"] = {
			func = vim.lsp.buf.declaration,
			opts = { desc = "Lsp: Go to declaration" },
		},
		["gd"] = {
			func = vim.lsp.buf.definition,
			opts = { desc = "Lsp: Go to definition" },
		},
		["gi"] = {
			func = vim.lsp.buf.implementation,
			opts = { desc = "Lsp: Go to implementation" },
		},
		["gt"] = {
			func = vim.lsp.buf.type_definition,
			opts = { desc = "Lsp: Go to type definition" },
		},
		["<leaderl>ls"] = {
			func = vim.lsp.buf.signature_help,
			opts = { desc = "Lsp: [s]ignature help" },
		},
		["<leader>lwa"] = {
			func = vim.lsp.buf.add_workspace_folder,
			opts = { desc = "Lsp: [w]orkspace [a]dd folder" },
		},
		["<leader>lwr"] = {
			func = vim.lsp.buf.remove_workspace_folder,
			opts = { desc = "Lsp: [w]orkspace [r]emove folder" },
		},
		["<leader>lwl"] = {
			func = function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			opts = { desc = "Lsp: [w]orkspace [l]ist folders" },
		},
		["<leader>lr"] = {
			func = function()
				require("nvchad.lsp.renamer")()
			end,
			opts = { desc = "Lsp: [r]ename" },
		},
		["<leader>la"] = {
			func = vim.lsp.buf.code_action,
			opts = { desc = "Lsp: Code action" },
		},

		["gu"] = {
			func = require("telescope.builtin").lsp_references,
			opts = { desc = "LSP: [g]oto [u]eses" },
		},
		["<leader>lds"] = {
			func = require("telescope.builtin").lsp_document_symbols,
			opts = { desc = "LSP: [d]ocument [s]ymbols (var, func, type)" },
		},
		["<leader>lws"] = {
			func = require("telescope.builtin").lsp_dynamic_workspace_symbols,
			opts = { desc = "LSP: [w]orkspace [s]ymbols (var, func, type)" },
		},

		["K"] = {
			func = vim.lsp.buf.hover,
			opts = { desc = "Lsp: hover information" },
		},
	},
}
M.on_attach = function(client, bufnr)
	local map = vim.keymap.set

	for mod, keys in pairs(M.mapping) do
		for key, value in pairs(keys) do
			map(mod, key, value["func"], value["opts"])
		end
	end
	-- setup signature popup
	if require("nvconfig").ui.lsp.signature and client.server_capabilities.signatureHelpProvider then
		require("nvchad.lsp.signature").setup(client, bufnr)
	end
end
-- disable semanticTokens
M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

M.setup = function(servers)
	servers = servers or M.servers
	local lspconf = require("lspconfig")
	for lsp, val in pairs(M.servers) do
		val["on_attach"] = val["on_attach"] or M.on_attach
		val["on_init"] = val["on_init"] or M.on_init
		val["capabilities"] = val["capabilities"] or M.capabilities
		lspconf[lsp].setup(val)
	end
end

return M
