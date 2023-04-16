local function matcher(ext, executors)
	local current_file = " " .. vim.fn.expand("%:t")
	return executors[ext](current_file)
end

local function runit(executors, terminal)
	if terminal == nil then
		terminal = "terminal"
	end

	vim.cmd(":vsplit")
	vim.cmd(": " .. terminal .. " " .. matcher(vim.fn.expand("%:e"), executors))
end

local function setup(terminal, executors)
	vim.api.nvim_create_user_command("RunIt", function()
		runit(terminal, executors)
	end, {})
end

return {
	setup = setup,
}
