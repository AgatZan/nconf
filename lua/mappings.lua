local map = vim.keymap.set
local comment = "c"
vim.g.mapleader = " "
map("n", "<leader>e", ":so<cr>", { desc = "[e]xecute" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "[Y]ank to clipboard" })
map({ "n", "v" }, "<leader>Y", '"+Y', { desc = "[Y]ank $ to clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "[D]elete to nothing" })
map({ "n", "v" }, "<leader>x", '"_x', { desc = "[D]elete char to nothing" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "[P]aste from clipboard" })
map({ "n", "v" }, "<leader>P", '"+P', { desc = "[P]aste from clipboard" })

map("n", "<leader>tf", "<Plug>PlenaryTestFile", { desc = "[T]est [F]ile" })
map("n", "<leader>td", "<CMD>PlenaryBustedDirectory . {sequential=true}<CR>", { desc = "[T]est [D]ir" })
map("n", "<leader>r", function()
	local def = vim.fn.expand("%")
	vim.ui.input({
		prompt = "Rename: ",
		default = def,
	}, function(input)
		if input then
			vim.uv.fs_rename(def, input)
		end
	end)
end, { desc = "[R]ename current file" })
map(
	"n",
	"gx",
	":!start <cfile><CR>",
	-- function()
	-- local file = vim.fn.expand "<cfile>"
	-- vim.print(file)
	-- vim.cmd("!start " .. file)
	-- end
	{ desc = "Goto url", remap = false }
)
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "File Copy whole" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<C-j>", "i<CR><ESC>")

map("n", "<esc>", ":noh<CR>", { noremap = true, silent = true })

-- ================ MOVING [I] ==============================
map("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move End of line" })
map("i", "<C-l>", "<Del>", { desc = "Delete after" })

-- map("i", "<m-h>", "<Left>", { desc = "move left [i]" })
-- map("i", "<m-l>", "<Right>", { desc = "move right [i]" })
-- map("i", "<m-k>", "<Up>", { desc = "move up [i]" })
-- map("i", "<m-j>", "<Down>", { desc = "move down [i]" })

-- =================== BUFFER ==============================

map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer New" })

-- =================== TERMINAL =======================

map("t", "<ESC>", function()
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_close(win, true)
end, { desc = "Terminal: Close term in terminal mode" })
map("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Ext terminal" })
-- =================== WINDOW =========================
map("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch Window up" })

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
-- map("n", "<leader>" .. comment, function()
-- 	require("Comment.api").toggle.linewise.current()
-- end, { desc = "Comment Toggle" })

-- map(
-- 	"v",
-- 	"<leader>" .. comment,
-- 	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
-- 	{ desc = "Comment Toggle" }
-- )
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "Lsp: [f]loating diagnostics" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Lsp: diagnostic loclist" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto prev([) [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next(]) [D]iagnostic message" })

-- ============================ FILE_BROWSER ===========================================
-- map(
-- 	"n",
-- 	"<C-n>",
-- 	"<cmd>NvimTreeToggle<CR>",
-- 	{ desc = "Nvimtree Toggle window" }
-- )
-- map(
-- 	"n",
-- 	"<leader>e",
-- 	"<cmd>NvimTreeFocus<CR>",
-- 	{ desc = "Nvimtree Focus window" }
-- )

-- ============================ TELESCOPE ===============================================

map("n", "<leader>lf", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "[l]sp [f]ormat" })

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
