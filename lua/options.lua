local opt = vim.opt
local o = vim.o
local g = vim.g

local tabwidth = 4
g.have_nerd_font = true
o.smartindent = true
o.breakindent = true
-------------------------------------- globals -----------------------------------------
g.toggle_theme_icon = "   "
-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

-- :h shellslash + https://github.com/nvim-orgmode/orgmode/issues/281#issuecomment-1120200775
-- o.spellslash = true

--[[ o.clipboard = "unnamedplus" ]]
o.cursorline = true
--o.cursorlineopt = "number"

-- Indenting
o.smartindent = true
o.expandtab = false
o.shiftwidth = tabwidth
o.tabstop = tabwidth
o.softtabstop = tabwidth

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.rnu = true
o.numberwidth = 2
o.ruler = false
-- Scroll
o.scrolloff = 4

-- disable nvim intro
opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false
-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
opt.list = true
opt.listchars = { eol = "↲", tab = "▸ ", trail = "·", lead = "·" }
-- disable some default providers
vim.g["loaded_node_provider"] = 0
vim.g["loaded_python3_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

-- Spell
o.spell = true
o.spl = "en,ru"
o.keymap = "russian-jcukenwin"
o.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
o.iminsert = 0
o.imsearch = 0

o.filetype = "on"
