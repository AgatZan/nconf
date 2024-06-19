return {
	"gbprod/phpactor.nvim",
	config = function()
		require("phpactor").setup {}
		require "phpactor.handler.update"()
	end,
}

