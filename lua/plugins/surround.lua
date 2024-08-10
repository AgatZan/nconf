-- return {
-- 	"echasnovski/mini.surround",
-- 	version = false,
-- 	config = true,
-- }
return {
	"kylechui/nvim-surround",
	-- "echasnovski/mini.surround",
	-- version = false,
	-- version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}
