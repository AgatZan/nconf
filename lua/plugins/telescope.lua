return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		{ "AgatZan/telescope-glyph.nvim", dev = true },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({

			defaults = {
				vimgrep_arguments = {
					"rg",
					"-L",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = { "node_modules" },
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = {
					n = { ["q"] = actions.close },
					i = {
						["<M-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.select_default,
						["<M-l>"] = actions.select_default,
						["<M-j>"] = actions.move_selection_next,
						["<tab>"] = actions.close,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("glyph")

		local builtin = require("telescope.builtin")
		local map = vim.api.nvim_set_keymap
		map(
			"n",
			" ff",
			"",
			{ callback = builtin.find_files, noremap = true, desc = "Telescope: [f]ind [f]iles in cwd" }
		)
		map(
			"n",
			"<leader>fg",
			"",
			{ callback = builtin.live_grep, noremap = true, desc = "Telescope: [f]ind [g]rep in cwd" }
		)
		map(
			"n",
			"<leader>fu",
			"",
			{ callback = builtin.grep_string, noremap = true, desc = "Telescope: [f]ind [u]nder cursor in cwd" }
		)
		map("n", "<leader>fb", "", { callback = builtin.buffers, noremap = true, desc = "Telescope: [f]ind [b]uffers" })
		map("n", "<leader>fr", "", { callback = builtin.lsp_references, noremap = true, desc = "Telescope: [f]ind [r]eferences" })
		map(
			"n",
			"<leader>fd",
			"",
			{ callback = builtin.diagnostics, noremap = true, desc = "Telescope: [f]ind [d]iagnostics" }
		)
		map(
			"n",
			"<leader>fc",
			"<cmd>Telescope glyph<cr>",
			{ noremap = true, desc = "Telescope: [f]ind special [c]har" }
		)
	end,
}
