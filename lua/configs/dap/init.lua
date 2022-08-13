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
	require("configs.dap.adapters.javascript").adapter(dap, js)
	require("configs.dap.adapters.nodejs").adater(dap)
	require("configs.dap.adapters.python").adapter(dap)
	require("configs.dap.adapters.lua").adapter(dap)
end

return M
