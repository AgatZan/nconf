vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yanking",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank { timeout = 100 }
	end,
})

