require("options")
require("autocmd")
require("mappings")
if vim.g.neovide then
	vim.g.neovide_cursor_trail_legnth = 0
	vim.g.neovide_cursor_animation_length = 0
	vim.o.guifont = "IosevkaTermSlab Nerd Font:h14"
end

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

NOTE_DIR = "F:\\#obsidian_handbook\\" or "~/note/"
DEV_DIR = "F:\\#utils\\nvim-plug\\" or "~/nvim-plug/"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		repo,
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("opts.lazy")

-- load plugins
require("lazy").setup("plugins", lazy_config)
