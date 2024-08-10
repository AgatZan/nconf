return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = function()
		local opts = require("opts.treesitter")
		require("nvim-treesitter.configs").setup(opts)
		--require "nvim-treesitter.install".compilers = {"cl"}
	end,
}
