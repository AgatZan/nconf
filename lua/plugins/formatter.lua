return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>lf",
			function()
				local m = vim.fn.mode()

				local range = nil
				if m == "v" or m == "V" or m == "\22" then -- <C-V>
					vim.cmd([[execute "normal! \<ESC>"]])
					local lstart = vim.fn.getpos("'<")[2]
					local lend = vim.fn.getpos("'>")[2]
					local end_line = vim.api.nvim_buf_get_lines(0, lend - 1, lend, true)[1]
					range = {
						start = { lstart, 0 },
						["end"] = { lend, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range })
			end,
			mode = "",
			desc = "LSP:[L]SP [F]ormat buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			html = { "prettier" },
			python = { "isort", "black" },
			javascript = { { "prettierd", "prettier" } },
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
		-- Customize formatters
		formatters = {
			-- shfmt = {
			-- 	prepend_args = { "-i", "2" },
			-- },
			prettier = {
				prepend_args = { "--use-tabs", "--tab-width", "4" },
				options = {
					-- Use a specific prettier parser for a filetype
					-- Otherwise, prettier will try to infer the parser from the file name
					ft_parsers = {
						--     javascript = "babel",
						--     javascriptreact = "babel",
						--     typescript = "typescript",
						--     typescriptreact = "typescript",
						--     vue = "vue",
						--     css = "css",
						--     scss = "scss",
						--     less = "less",
						html = "html",
						--     json = "json",
						--     jsonc = "json",
						--     yaml = "yaml",
						--     markdown = "markdown",
						--     ["markdown.mdx"] = "mdx",
						--     graphql = "graphql",
						--     handlebars = "glimmer",
					},
					-- Use a specific prettier parser for a file extension
					ext_parsers = {
						-- qmd = "markdown",
					},
				},
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
