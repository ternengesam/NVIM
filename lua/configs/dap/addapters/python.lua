local adapter = function(dap)
	local venv = os.getenv("VIRTUAL_ENV")
	dap.adapters.python = {
		type = "executable",
		command = vim.fn.getcwd() .. string.format("%s/bin/python", venv),
		args = { "-m", "debugpy.adapter" },
	}

	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",

			program = "${file}",
			pythonPath = function()
				local cwd = vim.fn.getcwd()

				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
					return cwd .. "/venv/bin/python"
				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"				
				else
					return "/usr/bin/python"
				end
			end,
		},
	}
end

return { adapter = adapter }
