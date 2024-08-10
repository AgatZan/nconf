-- return {
-- 	"Vigemus/iron.nvim",
-- 	config = function()
-- 		local iron = require("iron.core")
--
-- 		iron.setup({
-- 			config = {
-- 				config = {
-- 					-- Whether a repl should be discarded or not
-- 					scratch_repl = true,
-- 					-- Your repl definitions come here
-- 					repl_definition = {
-- 						js = {
-- 							command = { "node" },
-- 						},
-- 						python = {
-- 							command = { "python" }, -- or { "ipython", "--no-autoindent" }
-- 							format = require("iron.fts.common").bracketed_paste_python,
-- 						},
-- 					},
-- 					-- How the repl window will be displayed
-- 					-- See below for more information
-- 					repl_open_cmd = require("iron.view").bottom(40),
-- 				},
-- 				-- Iron doesn't set keymaps by default anymore.
-- 				-- You can set them here or manually add keymaps to the functions in iron.core
-- 				keymaps = {
-- 					send_motion = "<leader>rm",
-- 					visual_send = "<leader>rm",
-- 					send_file = "<leader>rf",
-- 					send_line = "<leader>rl",
-- 					send_paragraph = "<leader>rp",
-- 					send_until_cursor = "<leader>ru",
-- 					send_mark = "<leader>rm",
-- 					mark_motion = "<leader>rmm",
-- 					mark_visual = "<leader>rmv",
-- 					remove_mark = "<leader>rmd",
-- 					cr = "<leader>r<cr>",
-- 					interrupt = "<leader>r<space>",
-- 					exit = "<leader>rq",
-- 					clear = "<leader>rc",
-- 				},
-- 				-- If the highlight is on, you can change how it looks
-- 				-- For the available options, check nvim_set_hl
-- 				highlight = {
-- 					italic = true,
-- 				},
-- 				ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
-- 			},
-- 		})
-- 	end,
-- }
return {
	"milanglacier/yarepl.nvim",
	dependencies = {
		{
			"stevearc/dressing.nvim",
			opts = {},
		},
	},
	config = function()
		local yarepl = require("yarepl")
		yarepl.setup({
			metas = {
				python = { cmd = "python", formatter = yarepl.formatter.trim_empty_lines },
				bash = { cmd = "bash", formatter = yarepl.formatter.trim_empty_lines },
				javascript = { cmd = "node", formatter = yarepl.formatter.trim_empty_lines },
				zsh = { cmd = "zsh", formatter = yarepl.formatter.bracketed_pasting },
			},
		})
		local keymap = vim.keymap.set
		local autocmd = vim.api.nvim_create_autocmd
	end,
}
