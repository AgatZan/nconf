return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
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
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")

		local function border(hl_name)
			return {
				{ "╭", hl_name },
				{ "─", hl_name },
				{ "╮", hl_name },
				{ "│", hl_name },
				{ "╯", hl_name },
				{ "─", hl_name },
				{ "╰", hl_name },
				{ "│", hl_name },
			}
		end
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },

			-- chosen, you will need to read `:help ins-completion`
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

				-- Manually trigger a completion from nvim-cmp.
				--  Generally you don't need this, because nvim-cmp will display
				--  completions whenever it has completion options available.
				["<C-Space>"] = cmp.mapping.complete({}),
			}),
			sources = {
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "snippets" },
				{ name = "path" },
			},
			window = {
				completion = {
					side_padding = 1,
					winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
					scrollbar = false,
					border = border("CmpBorder"),
				},
				documentation = {
					border = border("CmpDocBorder"),
					winhighlight = "Normal:CmpDoc",
				},
			},
		})
	end,
}
