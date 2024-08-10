return {
	"LintaoAmons/scratch.nvim",
	event = "VeryLazy",
	opts = {
		scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim",
		use_telescope = true,
	},
	config = function()
		require("scratch").setup({
			scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim", -- where your scratch files will be put
			filetypes = { "lua", "js", "sh", "ts" }, -- you can simply put filetype here
			use_telescope = true,
		})
		vim.keymap.set("n", "<leader><leader>", "<cmd>Scratch<cr>")
		-- vim.keymap.set("n", "", "<cmd>ScratchOpen<cr>")
	end,
}
