local api = vim.api
local map = api.nvim_set_keymap
local comment = "c"
vim.g.mapleader = " "

-- vim.keymap.set("n", ":", function()
-- 	local feedkeys = function(key)
-- 		vim.api.nvim_feedkeys(
-- 			vim.api.nvim_replace_termcodes(key, true, true, true),
-- 			"n",
-- 			true
-- 		)
-- 	end
-- 	_fine_cmdline_omnifunc = function(start, base)
-- 		local line = vim.fn.getline "."
-- 		local input = line:sub(3) -- len('> ') + 1
-- 		if start == 1 then
-- 			local split = vim.split(input, " ")
-- 			local last_word = split[#split]
-- 			local len = #line - #last_word
--
-- 			for i = #split - 1, 1, -1 do
-- 				local word = split[i]
-- 				if vim.endswith(word, [[\\]]) then
-- 					break
-- 				elseif vim.endswith(word, [[\]]) then
-- 					len = len - #word - 1
-- 				else
-- 					break
-- 				end
-- 			end
--
-- 			return len
-- 		end
--
-- 		return vim.api.nvim_buf_call(vim.fn.bufnr "#", function()
-- 			return vim.fn.getcompletion(input .. base, "cmdline")
-- 		end)
-- 	end
--
-- 	local popup_options = {
-- 		relative = "cursor",
-- 		cmdline = {
-- 			enable_keymaps = true,
-- 			smart_history = true,
-- 			prompt = ": ",
-- 		},
-- 		position = {
-- 			row = 0,
-- 			col = 0,
-- 		},
-- 		size = 50,
-- 		border = {
-- 			style = "rounded",
-- 			text = {
-- 				top = "[CMD]",
-- 				top_align = "center",
-- 			},
-- 		},
-- 		win_options = {
-- 			winhighlight = "Normal:Normal",
-- 		},
-- 	}
--
-- 	local input = require "nui.input"(popup_options, {
-- 		prompt = ": ",
-- 		on_submit = function(value)
-- 			vim.fn.histadd("cmd", value)
-- 			local ok, err = pcall(vim.cmd, value)
-- 			if not ok then
-- 				local idx = err:find ":E"
-- 				if type(idx) ~= "number" then
-- 					return
-- 				end
-- 				local msg = err:sub(idx + 1):gsub("\t", "    ")
-- 				vim.notify(msg, vim.log.levels.ERROR)
-- 			end
-- 		end,
-- 	})
-- 	input:mount()
-- 	input:map("i", "<Esc>", function()
-- 		input:unmount()
-- 	end, { noremap = true })
-- 	input:map("i", "<Tab>", function()
-- 		if vim.fn.pumvisible() == 1 then
-- 			feedkeys "<C-n>"
-- 		else
-- 			feedkeys "<C-x><C-o>"
-- 		end
-- 	end, { noremap = true })
-- 	input:map("i", "<S-Tab>", function()
-- 		if vim.fn.pumvisible() == 1 then
-- 			feedkeys "<C-p>"
-- 		else
-- 			feedkeys "<C-x><C-z>"
-- 		end
-- 	end, { noremap = true })
-- 	vim.bo.omnifunc = "v:lua._fine_cmdline_omnifunc"
-- end)
--
