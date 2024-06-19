return {
	"folke/which-key.nvim",
	keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
	cmd = "WhichKey",
	config = function(_, opts)
		dofile(vim.g.base46_cache .. "whichkey")
		local wk = require "which-key"
		wk.setup(opts)
		wk.register {
			["<leader>"] = {
				l = {
					name = "+lsp",
					d = {
						name = "+document",
					},
					w = {
						name = "+workspace",
					},
				},
				h = {
					name = "+help",
				},
				f = {
					name = "+find",
				},
				t = {
					name = "+terminal",
				},
				s = {
					name = "+select",
				},
			},
		}
	end,
}

