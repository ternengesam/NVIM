local M = {}

local status, dap = pcall(require, "dap")
local ui_status, dapui = pcall(require, "dapui")
local js_ok, js = pcall(require, "dap-vscode-js")
if not status and ui_status and js_ok then
	return
end

M.ui = function()
	require("configs.dap.ui").ui(dapui)
end
M.py = function()
	require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
end
M.setup = function()
	local filetype = vim.o.filetype

	if filetype == "lua" then
		require("configs.dap.adapters.lua").adapter(dap)
	end

	if filetype == ("javascript" or "typescript" or "javascriptreact" or "typescriptreact") then
		require("configs.dap.adapters.javascript").adapter(dap, js)
		require("configs.dap.adapters.nodejs").adater(dap)
	end

	if filetype == "python" then
		require("configs.dap.adapters.python").adapter(dap)
	end
end

return M
