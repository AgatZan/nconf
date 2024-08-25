return {
	--[[ "nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-neotest/neotest-plenary",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-plenary"),
			},
		})
		vim.keymap.set("n", "<leader>tf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "[T]est [F]ile" })

		vim.keymap.set("n", "<leader>td", function() end, { desc = "[T]est [D]ir" })
	end, ]]
}
