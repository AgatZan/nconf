return {
	"NeogitOrg/neogit",
	config = function()
		require("neogit").setup({
			integrations = {
				diffview = true,
				telescope = true,
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		-- "ibhagwan/fzf-lua", -- optional
	},
}
