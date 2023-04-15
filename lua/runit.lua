local function matcher(ext, executors)
	local current_file = " " .. vim.fn.expand("%:t")
	return executors[ext](current_file)
end

local function runit(executors)
	vim.cmd(":vsplit")
	vim.cmd(":terminal " .. matcher(vim.fn.expand("%:e"), executors))
end

local function setup(executors)
	vim.api.nvim_create_user_command("RunIt", function()
		runit(executors)
	end, {})
end

return {
	setup = setup,
}
