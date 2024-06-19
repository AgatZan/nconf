return {
	"LintaoAmons/scratch.nvim",
	keys = {
		{
			"<leader><leader>",
			function()
				local pickers = require "telescope.pickers"
				local finders = require "telescope.finders"
				local conf = require("telescope.config").values
				local actions = require "telescope.actions"
				local action_state = require "telescope.actions.state"
				pickers
					.new(require("telescope.themes").get_dropdown {}, {
						prompt_title = "Choose File Type",
						finder = finders.new_table {
							results = { "lua", "py", "md", "php" },
						},
						sorter = conf.values,
						attach_mappings = function(prompt_bufnr, map)
							actions.select_default:replace(function()
								actions.close(prompt_bufnr)
								local selection =
									action_state.get_selected_entry()
								require("scratch").scratchByType(selection[1])
							end)
							return true
						end,
					})
					:find()
			end,
			desc = "Open Scratch",
		},
		{
			"<leader>fs",
			":ScratchOpen<CR>",
			desc = "Telescope: [f]ind [s]cratch",
		},
	},
	event = "VeryLazy",
}

