vim.o.conceallevel = 2
--vim.cmd([[syntax match InlineFold /\v\(\zs.{-}\ze\)/ conceal cchar=…]])
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
npairs.add_rule(Rule("$", "$", "org"))
