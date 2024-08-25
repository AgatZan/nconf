return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		--map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvim-Tree: toggle window" })
		--vim.keymap.set("n", "<Up>", "<cmd>NvimTreeFocus<CR>", { desc = "Nvim-Tree: open" })
		vim.keymap.set("n", "<Up>", function()
			local api = require("nvim-tree.api")
			if api.tree.is_visible() then
				api.tree.close()
			else
				api.tree.open({ current_window = true })
			end
		end, { desc = "Nvim-Tree: open" })

		vim.keymap.set("n", "<leader>ne", function()
			local api = require("nvim-tree.api")
			if api.tree.is_visible() then
				api.tree.close()
			end
			api.tree.open({ current_window = true, path = NOTE_DIR })
		end, { desc = "Note: [N]ote [E]xplorer" })
		require("nvim-tree").setup({
			filters = {
				git_ignored = false,
				-- git_clean = true,
			},
			on_attach = function(bufnr)
				local function opts(desc)
					return { desc = "Nvim-Tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end
				local api = require("nvim-tree.api")
				-- api.config.mappings.default_on_attach(bufnr)
				vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
				vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
				vim.keymap.set("n", "<Up>", api.tree.change_root_to_parent, opts("Move to Parent"))
				vim.keymap.set("n", "<Down>", api.tree.change_root_to_node, opts("Move to Select"))
				vim.keymap.set("n", "<CR>", api.node.open.replace_tree_buffer, opts("Focus to file"))
				vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
				vim.keymap.set("n", "a", api.fs.create, opts("Create File Or Directory"))
				vim.keymap.set("n", "A", function()
					local node = api.tree.get_node_under_cursor()
					api.fs.create(node.parent or node)
				end, opts("Create File Or Directory Parent"))
				vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy file"))
				vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
				vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
				vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
				vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
				vim.keymap.set("n", "q", api.tree.close, opts("Close"))
				vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
				vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
				vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
			end,
		})
	end,
}
--return {
--	"stevearc/oil.nvim",
--	config = function()
--		require("oil").setup({
--			default_file_explorer = false,
--			skip_confirm_for_simple_edits = true,
--			keymaps = {
--				["<Down>"] = "actions.select",
--				["<Up>"] = "actions.parent",
--			},
--		})
--	end,
--}
