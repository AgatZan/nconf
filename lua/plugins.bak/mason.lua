return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
	config = function()
		local opts = require "nvchad.configs.mason" 
		dofile(vim.g.base46_cache .. "mason")
		require("mason").setup(opts)

		-- custom nvchad cmd to install all mason binaries listed
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			if opts.ensure_installed and #opts.ensure_installed > 0 then
				vim.cmd(
					"MasonInstall " .. table.concat(opts.ensure_installed, " ")
				)
			end
		end, {})

		vim.g.mason_binaries_list = opts.ensure_installed
	end,
}

