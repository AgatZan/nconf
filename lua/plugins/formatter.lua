return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
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
			c = { "clang-format" },
		},
		-- Set up format-on-save
		-- format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
		-- Customize formatters
		-- formatters = {
		-- 	prettier = {
		-- 		prepend_args = { "--use-tabs", "--tab-width", "4" },
		-- 		options = {
		-- 			ft_parsers = {
		-- 				html = "html",
		-- 			},
		-- 		},
		-- 	},
		-- },
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
