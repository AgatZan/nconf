local map = vim.api.nvim_set_keymap
_G.__local = {}
_G = setmetatable(_G, {
	__index = function(self, k)
		return self.__local[k] or rawget(self, k)
	end,
})

local call = function()
	local fun = vim.api.nvim_get_current_line()
	local f = loadstring(fun .. [[
	__stop=1 
	while __stop <= 10 do 
		local a,b=debug.getlocal(1, __stop)
		if a == nil then break end
		__local[a]=b
		__stop= __stop+1
	end
	]])
	debug.sethook()
	f()
end
local call_v = function()
	local fu = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.api.nvim_get_mode().mode })
	local fun = fu[1]
	for i = 2, #fu do
		fun = fun .. "\n" .. fu[i]
	end
	local f = loadstring(fun .. [[
	__stop=1 
	while __stop <= 10 do 
		local a,b=debug.getlocal(1, __stop)
		if a == nil then 
			break 
		end
		__local[a]=b
		__stop= __stop+1
	end
	]])
	f()
end
map("v", "<cr>", "", { desc = "[e]xecute", noremap = true, callback = call_v })
map("n", "<cr>", "", { desc = "[e]xecute", noremap = true, callback = call })
map("n", "<leader>c", "<leader>wvgd", { desc = "[L]ayout"  })
