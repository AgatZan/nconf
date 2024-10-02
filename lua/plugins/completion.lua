return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			-- "L3MON4D3/LuaSnip",
			-- --build = "make install_jsregexp",
			-- dependencies = {
			-- 	{
			-- 		"rafamadriz/friendly-snippets",
			-- 		config = function()
			-- 			require("luasnip.loaders.from_vscode").lazy_load()
			-- 			require("luasnip.loaders.from_vscode").load({
			-- 				path = { "./snippets" },
			-- 			})
			-- 		end,
			-- 	},
			-- },
			"garymjr/nvim-snippets",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
			opts = {
				friendly_snippets = true,
				snippetDir = { vim.fn.stdpath("config") .. "/snippets" },
			},
			keys = {
				{
					"<C-l>",
					function()
						if vim.snippet.active({ direction = 1 }) then
							vim.schedule(function()
								vim.snippet.jump(1)
							end)
							return
						end
						return "<C-l>"
					end,
					expr = true,
					silent = true,
					mode = "i",
				},
				{
					"<C-l>",
					function()
						vim.schedule(function()
							vim.snippet.jump(1)
						end)
					end,
					expr = true,
					silent = true,
					mode = "s",
				},
				{
					"<C-h>",
					function()
						if vim.snippet.active({ direction = -1 }) then
							vim.schedule(function()
								vim.snippet.jump(-1)
							end)
							return
						end
						return "<C-h>"
					end,
					expr = true,
					silent = true,
					mode = { "i", "s" },
				},
			},
		},
		{
			"chrisgrieser/nvim-scissors",
			keys = {
				{
					"<leader>se",
					function()
						require("scissors").editSnippet()
					end,
					desc = "[S]nippet [E]dit",
				},
				{
					mode = { "n", "x" },
					"<leader>sa",
					function()
						require("scissors").addNewSnippet()
					end,
					desc = "[S]nippet [A]dd",
				},
			},
			dependencies = { "nvim-telescope/telescope.nvim" },
			opts = {
				snippetDir = vim.fn.stdpath("config") .. "/snippets",
			},
		},
		-- "saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		-- local luasnip = require("luasnip")
		-- luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					-- luasnip.lsp_expand(args.body)
					vim.snippet.expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },

			-- chosen, you will need to read `:help ins-completion`
			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),

				-- Scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				-- If you prefer more traditional completion keymaps,
				-- you can uncomment the following lines
				--['<CR>'] = cmp.mapping.confirm { select = true },
				--['<Tab>'] = cmp.mapping.select_next_item(),
				--['<S-Tab>'] = cmp.mapping.select_prev_item(),

				-- Manually trigger a completion from nvim-cmp.
				--  Generally you don't need this, because nvim-cmp will display
				--  completions whenever it has completion options available.
				["<C-Space>"] = cmp.mapping.complete({}),

				-- Think of <c-l> as moving to the right of your snippet expansion.
				--  So if you have a snippet that's like:
				--  function $name($args)
				--    $body
				--  end
				--
				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				-- ["<C-l>"] = cmp.mapping(function()
				-- 	if luasnip.expand_or_locally_jumpable() then
				-- 		luasnip.expand_or_jump()
				-- 	end
				-- end, { "i", "s" }),
				-- ["<C-h>"] = cmp.mapping(function()
				-- 	if luasnip.locally_jumpable(-1) then
				-- 		luasnip.jump(-1)
				-- 	end
				-- end, { "i", "s" }),
			}),
			sources = {
				{ name = "lazydev" },
				{
					name = "nvim_lsp",
					-- option = {
					-- 	markdown_oxide = {
					-- 		keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
					-- 	},
					-- },
				},
				{ name = "snippets" },
				-- { name = "luasnip" },
				{ name = "path" },
			},
		})
	end,
}
