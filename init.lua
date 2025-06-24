--- [[OPTIONS
local api = vim.api
local setvar, getvar, setopt, nvim_create_autocmd, map =
	vim._setvar, vim._getvar, api.nvim_set_option_value, api.nvim_create_autocmd, api.nvim_set_keymap
local opt = {}

local tabwidth = 4

setvar("g", 0, "mapleader", " ")
setvar("g", 0, "have_nerd_font", true)
setopt("smartindent", true, opt)
setopt("breakindent", true, opt)

setopt("guifont", "IoZanCode Nerd Font:h14", opt)
setopt("guicursor", "n-v-sm:block,i-c-ci-ve-t:ver25,r-cr-o:hor20", opt)
-------------------------------------- options ------------------------------------------
setopt("laststatus", 3, opt)
setopt("showmode", false, opt)

-- :h shellslash + https://github.com/nvim-orgmode/orgmode/issues/281#issuecomment-1120200775
-- setopt("spellslash", true, opt)

-- o.clipboard = "unnamedplus"
-- setopt("cursorline", true, opt)
--setopt("cursorlineopt", "number", opt)

-- Indenting
setopt("smartindent", true, opt)
setopt("expandtab", false, opt)
setopt("shiftwidth", tabwidth, opt)
setopt("tabstop", tabwidth, opt)
setopt("softtabstop", tabwidth, opt)

setopt("ignorecase", true, opt)
setopt("smartcase", true, opt)
setopt("mouse", "a", opt)

-- Numbers
setopt("number", true, opt)
setopt("rnu", true, opt)
setopt("numberwidth", 2, opt)
setopt("ruler", false, opt)
-- Scroll
setopt("scrolloff", 4, opt)

-- disable nvim intro
setopt("shortmess", "ltToOCFsI", opt)

setopt("signcolumn", "yes", opt)
setopt("splitbelow", true, opt)
setopt("splitright", true, opt)
setopt("timeoutlen", 400, opt)
setopt("undofile", true, opt)

-- setopt("foldmethod", "indent", opt)
-- setopt("foldmethod", "expr", opt)
setopt("foldexpr", "nvim_treesitter#foldexpr()", opt)
setopt("foldenable", false, opt)
-- interval for writing swap file to disk, also used by gitsigns
setopt("updatetime", 250, opt)

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
setopt("whichwrap", "<,>,[,],h,l,b,s", opt)
setopt("list", true, opt)
-- setopt("fillchars", "eol: ", opt)
setopt("listchars", "eol:↲,tab:│ ,trail:·,lead:·", opt)
-- disable some default providers
setvar("g", 0, "loaded_node_provider", 0)
setvar("g", 0, "loaded_python3_provider", 0)
setvar("g", 0, "loaded_perl_provider", 0)
setvar("g", 0, "loaded_ruby_provider", 0)

-- Spell
setopt("spell", true, opt)
setopt("spl", "en,ru", opt)
setopt("keymap", "russian-jcukenwin", opt)
setopt(
	"langmap",
	"ЙЦУКЕ;QWERT,йцуке;qwert,ФЫВАП;ASDFG,фывап;asdfg,ЯЧСМИ;ZXCVB,ячсми;zxcvb,нгшщзх;yuiop[,РОЛДЖЭ;HJKL:\\\",ролджэ;hjkl\\;',ТЬБЮ;NM<>,тьбю;nm./",
	opt
)
setopt("iminsert", 0, opt)
setopt("imsearch", 0, opt)

setopt("filetype", "on", opt)
--- OPTIONS]]
--- [[MAPPINGS
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
map("i", "<BS>", "", {
	noremap = true,
	expr = true,
	replace_keycodes = true,
	callback = function()
		local pos = api.nvim_win_get_cursor(0)
		local line = api.nvim_buf_get_lines(0, pos[1] - 1, pos[1], true)[1]
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

map("n", "<leader>bc", "<cmd>enew<CR>", { desc = "[B]uffer [C]reate" })
map("n", "<leader>bn", "<cmd>bn<CR>", { desc = "[B]uffer [N]ext" })
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "[B]uffer [P]rev" })

-- =================== TERMINAL =======================

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
local buf
map("n", "<leader>t", "<cmd>te<cr>", {
	-- callback = function()
	-- 	if not api.nvim_buf_is_valid(buf) then
	-- 		buf = api.nvim_create_buf(true, true)
	-- 	end
	-- 	local editor_width = api.nvim_get_option_value("columns", { scope = "global" })
	-- 	local editor_height = api.nvim_get_option_value("lines", { scope = "global" })
	-- 	local width, height = math.floor(editor_width * 0.75), math.floor(editor_height * 0.5)
	-- 	local row, col = math.floor(0.5 * editor_width - width / 2), math.floor(0.5 * editor_height - height / 2)
	-- 	api.nvim_open_win(
	-- 		buf,
	-- 		true,
	-- 		{ relative = "editor", row = row, col = col, width = width, height = height, style = "minimal" }
	-- 	)
	-- 	vim.cmd(":term")
	-- end,
	desc = "[T]erminal float",
})
--- MAPPINGS]]
--- [[AUTOCMD
nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yanking",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})
nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local buf = event.buf
		local function bmap(mode, keys, func, desc)
			api.nvim_buf_set_keymap(buf, mode, keys, "", { noremap = true, callback = func, desc = desc })
		end
		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		bmap("n", "gd", require("telescope.builtin").lsp_definitions, "LSP: [G]oto [D]efinition")

		-- Find references for the word under your cursor.
		bmap("n", "gr", require("telescope.builtin").lsp_references, "LSP: [G]oto [R]eferences")

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		bmap("n", "gI", require("telescope.builtin").lsp_implementations, "LSP: [G]oto [I]mplementation")

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		bmap("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, "LSP: Type [D]efinition")

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		bmap("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols, "LSP: [F]ind [S]ymbols")

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		bmap("n", "<leader>fw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "LSP: [F]ind [W]orkspace")

		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		bmap("n", "<leader>lr", vim.lsp.buf.rename, "LSP: [R]ename")

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		bmap("n", "<leader>la", vim.lsp.buf.code_action, "LSP: Code [A]ction")

		bmap("v", "<leader>la", vim.lsp.buf.code_action, "LSP: Code [A]action")
		-- Opens a popup that displays documentation about the word under your cursor
		--  See `:help K` for why this keymap.
		bmap("n", "K", vim.lsp.buf.hover, "LSP: Hover Documentation")

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		bmap("n", "gD", vim.lsp.buf.declaration, "LSP: [G]oto [D]eclaration")

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client then
			if client.server_capabilities.documentHighlightProvider then
				local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
				nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})
				nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})
				nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
					end,
				})
			end
			-- The following autocommand is used to enable inlay hints in your
			-- code, if the language server you are using supports them
			--
			-- This may be unwanted, since they displace some of your code
			if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
				bmap("n", "<leader>lt", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, "[L]sp [T]oggle Inlay hints")
			end
		end
	end,
})
-- AUTOCMD]]
if getvar("g", 0, "neovide") then
	setvar("g", 0, "neovide_cursor_trail_length", 0)
	setvar("g", 0, "neovide_cursor_animation_length", 0)

	local map = vim.api.nvim_set_keymap
	map("n", "<C-+>", "", {
		callback = function()
			setvar("g", 0, "neovide_scale_factor", getvar("g", 0, "neovide_scale_factor") + 0.1)
		end,
		desc = "Font +",
	})
	map("n", "<C-->", "", {
		callback = function()
			setvar("g", 0, "neovide_scale_factor", getvar("g", 0, "neovide_scale_factor") - 0.1)
		end,
		desc = "Font -",
	})
	map("n", "<C-0>", "", {
		callback = function()
			setvar("g", 0, "neovide_scale_factor", 1)
		end,
		desc = "Font default",
	})
end
setvar("g", 0, "os_sep", package.config:sub(1, 1))
setvar("g", 0, "NOTE_DIR", "F:\\#obsidian_handbook\\" or "~/note/")
setvar("g", 0, "DEV_DIR", "F:\\#utils\\nvim-plug\\" or "~/nvim-plug/")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not uv.fs_stat(lazypath) then
-- local uv = vim.uv
-- 	vim.fn.system({
-- 		"git",
-- 		"clone",
-- 		"--filter=blob:none",
-- 		"https://github.com/folke/lazy.nvim.git",
-- 		"--branch=stable",
-- 		lazypath,
-- 	})
-- end
setopt("rtp", api.nvim_get_option_value("rtp", {}) .. "," .. lazypath, opt)
-- vim.opt.rtp:prepend(lazypath)
local lazy_config = {
	change_detection = {
		notify = false,
	},
	dev = {
		path = getvar("g", 0, "DEV_DIR"),
	},
	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},

	performance = {
		rtp = {
			disabled_plugins = {},
		},
	},
}
require("lazy").setup("plugins", lazy_config)
