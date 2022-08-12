local adapter = function(dap)
	dap.configurations.lua = {
		{

			type = "nlua",
			request = "attach",
			name = "Attach to nvim",
			host = function ()
			 local val = vim.fn.input("host: default is 127.0.0.1 : ")
			  if val ~= "" then
			return val
			  end
			  return "127.0.0.1"
			end,
			port = function()
				local val = tonumber(vim.fn.input("port: "))
				assert(val, "port is required")
				return val
			end,
		},
	}
	dap.adapters.nlua = function(cb, config)
		cb({ type = "server", host = config.host, port = config.port })
	end
end
return {adapter = adapter}
