return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = function()
		return require "opts.conform"
	end,
}

