local options = {
	ensure_installed = { "lua", "vim", "vimdoc", "javascript" },
	ignore_install = { "org" },

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>si", -- set to `false` to disable one of the mappings
			node_incremental = "<leader>si",
			scope_incremental = "<leader>sc",
			node_decremental = "<leader>sd",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,

			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				-- You can optionally set descriptions to the mappings (used in the desc parameter of
				-- nvim_buf_set_keymap) which plugins like which-key display
				["ic"] = {
					query = "@class.inner",
					desc = "Select inner part of a class region",
				},
				-- You can also use captures from other query groups like `locals.scm`
				["as"] = {
					query = "@scope",
					query_group = "locals",
					desc = "Select language scope",
				},
			},
			-- You can choose the select mode (default is charwise 'v')
			selection_modes = {
				["@parameter.outer"] = "v",
				["@function.outer"] = "V",
				["@class.outer"] = "<c-v>",
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			include_surrounding_whitespace = true,
		},
	},
}

return options
