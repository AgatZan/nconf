vim.opt.completopt = { "menu", "menuone", "noselect"}
vim.opt.shortmess:append "c"

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end
local cmp = require "cmp"	
cmp.setup {
	sources = {
	    { name = "nvim_lsp" },
	    { name = "luasnip" },
	    { name = "buffer" },
	    { name = "nvim_lua" },
	    { name = "path" },
  	},
	mapping = {
		["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<C-l>"] = cmp.mapping.scroll_docs(-4),
		["<C-h>"] = cmp.mapping.scroll_docs(4),
		["<C-k>"] = cmp.mapping.close(),

		["<C-y>"] =cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			{ "i", "c"}
		), 
	},
  	snippet = {
   		expand = function(args)
    	  require("luasnip").lsp_expand(args.body)
    	end,
  	},

  	window = {
    	completion = {
			side_padding = 1,
			winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
			scrollbar = false,
			border = border "CmpBorder"
    	},
    	documentation = {
      		border = border "CmpDocBorder",
      		winhighlight = "Normal:CmpDoc",
    	},
  	},
}


local ls = require "luasnip"
ls.config.set_config { 
	history = true,
	updateevents = "TextChanged,TextChangedI" 
}

vim.keymap.set( {"i", "s"}, "<A-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true})
vim.keymap.set( {"i", "s"}, "<A-j>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, { silent = true})

