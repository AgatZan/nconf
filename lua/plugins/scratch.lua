return {
	{
		"AgatZan/scratch.nvim",
		branch = "mini",
		opts = {
			win_config = {
				split = "below",
				win = 0,
			},
		},
		keys = {
			{ "<leader><leader>", "<cmd>Scratch<cr>", desc = "Scratch buffer", mode = { "n", "v" } },
			{ "<leader>ft", "<cmd>ScratchOpen<cr>", desc = "[F]ind [T]emplate(Scratch dir)" },
		},
	},
	{
		"AgatZan/session.nvim",
		cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
		opts = {}, --config
	},
}
