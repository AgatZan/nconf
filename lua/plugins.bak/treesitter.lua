return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = function()
		local opts = require "opts.treesitter"
		dofile(vim.g.base46_cache .. "syntax")
		dofile(vim.g.base46_cache .. "treesitter")
		require("nvim-treesitter.configs").setup(opts)
	end,
}

