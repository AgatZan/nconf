require("options")
require("autocmd")
require("mappings")
if vim.g.neovide then
	vim.g.neovide_cursor_trail_length = 0
	vim.g.neovide_cursor_animation_length = 0
end
vim.g.os_sep = vim.uv.os_uname().sysname == "Windows_NT" and "\\" or "/"
vim.g.NOTE_DIR = "F:\\#obsidian_handbook\\" or "~/note/"
vim.g.DEV_DIR = "F:\\#utils\\nvim-plug\\" or "~/nvim-plug/"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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
local lazy_config = {
	change_detection = {
		notify = false,
	},
	dev = {
		path = vim.g.DEV_DIR,
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
			disabled_plugins = {
				--				"2html_plugin",
				--				"tohtml",
				--				"getscript",
				--				"getscriptPlugin",
				--				"gzip",
				--				"logipat",
				--				--"netrw",
				--				--"netrwPlugin",
				--				--"netrwSettings",
				--				--"netrwFileHandlers",
				--				"matchit",
				--				"tar",
				--				"tarPlugin",
				--				"rrhelper",
				--				-- "spellfile_plugin",
				--				"vimball",
				--				"vimballPlugin",
				--				"zip",
				--				"zipPlugin",
				--				"tutor",
				--				"rplugin",
				--				"syntax",
				--				"synmenu",
				--				-- "optwin",
				--				--"compiler",
				--				"bugreport",
				-- "ftplugin",
			},
		},
	},
}
require("lazy").setup("plugins", lazy_config)
