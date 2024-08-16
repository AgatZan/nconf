return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			lua = { "selene" },
		}
		lint.linters.selene.args = {
			"--config " .. vim.fn.stdpath("config"),
		}
	end,
}
