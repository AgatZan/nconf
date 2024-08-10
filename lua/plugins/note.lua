return {
	{
		"IlyasYOY/obs.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"IlyasYOY/coredor.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		-- dev = true,
		keys = {
			{ "<leader>nf", "<cmd>ObsNvimFollowLink<cr>", desc = "[N]ote [F]ollow" },
			{ "<leader>nn", "<cmd>ObsNvimNewNote<cr>", desc = "[N]ote [N]ew" },
			{ "<leader>ny", "<cmd>ObsNvimCopyObsidianLinkToNote<cr>", desc = "[N]ote [Y]ank link" },
			{ "<leader>nd", "<cmd>ObsNvimDailyNote<cr>", desc = "[N]ote [D]aily" },
			{ "<leader>nw", "<cmd>ObsNvimWeeklyNote<cr>", desc = "[N]ote [W]eekly" },
			{ "<leader>nr", "<cmd>ObsNvimRename<cr>", desc = "[N]ote [R]ename" },
			{ "<leader>nt", "<cmd>ObsNvimTemplate<cr>", desc = "[N]ote [T]emplate" },
			{ "<leader>nm", "<cmd>ObsNvimMove<cr>", desc = "[N]ote [M]ove" },
			{ "<leader>nb", "<cmd>ObsNvimBacklinks<cr>", "[N]ote [B]acklink" },
			{ "<leader>fj", "<cmd>ObsNvimFindInJournal<cr>", "[F]ind [J]ournal" },
			{ "<leader>fn", "<cmd>ObsNvimFindNote<cr>", "[F]ind [N]ote" },
			-- { "<leader>nfg", "<cmd>ObsNvimFindInNotes<cr>", "[N]ote []" },
		},
		config = function()
			local obs = require("obs")

			obs.setup({
				vault_home = NOTE_DIR,
				vault_name = "Note",
				templater = {
					home = NOTE_DIR,
					include_default_providers = true,
				},
				journal = {
					template_name = "daily",
					home = NOTE_DIR .. "\\daily",
				},
			})
			require("cmp").register_source("obs", require("obs.cmp-source").new())
		end,
	},
}
