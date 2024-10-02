return {
	"AgatZan/scratch.nvim",
	-- dev = true,
	branch = "mini",
	---@type Scratch.Config?
	opts = {},
	keys = {
		{ "<leader><leader>", "<cmd>Scratch<cr>", desc = "Scratch buffer", mode = { "n", "v" } },
		{ "<leader>ft", "<cmd>ScratchOpen<cr>", desc = "[F]ind [T]emplate(Scratch dir)" },
	},
}
