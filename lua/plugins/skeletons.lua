return {
	"AgatZan/esqueleto.nvim",
	---@type Esqulato.config
	opts = {
		patterns = { "python" },
		-- selector = require("esqueleto.selectors.telescope"),
	},
	config = function()
		local selector = require("esqueleto.selectors.telescope")
		require("esqueleto").setup({
			patterns = { "python" },
			selector = selector,
		})
	end,
}
