local map = vim.api.nvim_set_keymap
local comment = "c"
vim.g.mapleader = " "
map("n", "<leader>y", '"+y', { desc = "[Y]ank to clipboard" })

map("v", "<leader>y", '"+y', { desc = "[Y]ank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "[Y]ank $ to clipboard" })
map("v", "<leader>Y", '"+Y', { desc = "[Y]ank $ to clipboard" })
map("n", "<leader>d", '"_d', { desc = "[D]elete to nothing" })
map("v", "<leader>d", '"_d', { desc = "[D]elete to nothing" })
map("n", "<leader>p", '"+p', { desc = "[P]aste from clipboard" })
map("v", "<leader>p", '"+p', { desc = "[P]aste from clipboard" })
map("n", "<leader>P", '"+P', { desc = "[P]aste from clipboard" })
map("v", "<leader>P", '"+P', { desc = "[P]aste from clipboard" })

map("i", "(", "()<Left>", { noremap = true })
map("i", "[", "[]<Left>", { noremap = true })
map("i", "{", "{}<Left>", { noremap = true })
map("i", "{<cr>", "{}<Left><CR>\t<CR><Up><End>", { noremap = true })
map("i", '"', '""<Left>', { noremap = true })
map("i", "'", "''<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<BS>", "", {
	noremap = true,
	expr = true,
	replace_keycodes = true,
	callback = function()
		local pos = vim.api.nvim_win_get_cursor(0)
		local line = vim.api.nvim_buf_get_lines(0, pos[1] - 1, pos[1], true)[1]
		local char = line:sub(pos[2], pos[2])
		local rchar = line:sub(pos[2] + 1, pos[2] + 1)
		if
			char == "(" and rchar == ")"
			or char == "[" and rchar == "]"
			or char == "{" and rchar == "}"
			or (rchar == "'" or char == '"') and rchar == char
		then
			return "<BS><DEL>"
		end
		return "<BS>"
	end,
})
map("n", "<leader>tf", "<Plug>PlenaryTestFile", { desc = "[T]est [F]ile" })
map("n", "<leader>td", "<CMD>PlenaryBustedDirectory . {sequential=true}<CR>", { desc = "[T]est [D]ir" })
map("n", "<leader>r", "", {
	desc = "[R]ename current file",
	callback = function()
		local def = vim.fn.expand("%")
		vim.ui.input({
			prompt = "Rename: ",
			default = def,
		}, function(input)
			if input then
				vim.uv.fs_rename(def, input)
			end
		end)
	end,
})
map("n", "gx", ":!start <cfile><CR>", { desc = "Goto url", noremap = true })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "File Copy whole" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
-- map("n", "<C-j>", "i<CR><ESC>", {})

map("n", "<esc>", ":noh<CR>", { noremap = true, silent = true })

-- ================ MOVING [I] ==============================
map("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move End of line" })
map("i", "<C-l>", "<Del>", { desc = "Delete after" })
-- map("i", "<m-h>", "<Left>", { desc = "move left [i]" })
-- map("i", "<m-l>", "<Right>", { desc = "move right [i]" })
-- map("i", "<m-j>", "<Down>", { desc = "move down [i]" })
-- map("i", "<m-k>", "<Up>", { desc = "move up [i]" })

-- =================== BUFFER ==============================

map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer New" })

-- =================== TERMINAL =======================

-- map("t", "<ESC>", function()
-- 	local win = vim.api.nvim_get_current_win()
-- 	vim.api.nvim_win_close(win, true)
-- end, { desc = "Terminal: Close term in terminal mode" })
map("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Ext terminal" })
-- =================== WINDOW =========================
map("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch Window up" })

map("n", "<leader>wv", "<cmd>vs<CR>", { desc = "[W]indow [V]ertical split" })
map("n", "<leader>ws", "<cmd>sp<CR>", { desc = "[W]indow [S]plit" })

-- ================ SWAP LINES ========================
map("n", "<m-k>", ":m-2<cr>", { desc = "move line up [n]" })
map("n", "<m-j>", ":m+<cr>", { desc = "move line down [n]" })

map("n", "<m-S-k>", ":co-1<cr>", { desc = "copy line up [n]" })
map("n", "<m-S-j>", ":co.<cr>", { desc = "copy line down [n]" })
map("i", "<m-S-k>", "<esc>:m-2<cr>i", { desc = "move line up [i]" })
map("i", "<m-S-j>", "<ESC>:m+<CR>i", { desc = "Move line down [i]" })

map("v", "<m-k>", ":'<,'>move-2<CR>gv=gv", { desc = "move line down [v]" })
map("v", "<m-j>", ":m '>+1<cr>gv=gv", { desc = "move line up [v]" })

map("v", "<m-S-k>", ":'<,'>co+<CR>gv", { desc = "copy line down [v]" })
map("v", "<m-S-j>", ":'<,'>co-1<CR>gv", { desc = "copy line up [v]" })

-- ========================= COMMENT =============================
map("n", "<leader>ld", "", { callback = vim.diagnostic.open_float, desc = "Lsp: [d]iagnostics" })
map("n", "<leader>q", "", { callback = vim.diagnostic.setloclist, desc = "Lsp: diagnostic loclist" })
map("n", "[d", "", { callback = vim.diagnostic.goto_prev, desc = "Goto prev([) [D]iagnostic message" })
map("n", "]d", "", { callback = vim.diagnostic.goto_next, desc = "Goto next(]) [D]iagnostic message" })


-- ============================ TELESCOPE ===============================================

map("n", "<leader>lf", "", {
	callback = function()
		require("conform").format({ lsp_fallback = true })
	end,
	desc = "[l]sp [f]ormat",
})

-- ===================== FLOAT CMD ==========================

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
