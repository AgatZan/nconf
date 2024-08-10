return {
	"malbertzard/inline-fold.nvim",
	-- enabled = false,
	opts = {
		defaultPlaceholder = "…",
		queries = {
			org = {
				{ pattern = "\v\\(\zs.{-}\ze\\)", placeholder = "•••" },
			},
			-- html = {
			--   { pattern = 'class="([^"]*)"', placeholder = "@" }, -- classes in html
			--   { pattern = 'href="(.-)"' }, -- hrefs in html
			--   { pattern = 'src="(.-)"' }, -- HTML img src attribute
			-- }
		},
	},
}
