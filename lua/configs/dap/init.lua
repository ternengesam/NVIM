local M = {}
local status, dap = pcall(require, "dap")
local ui_status, dapui = pcall(require, "dapui")
if not status and ui_status then
	return
end

M.ui = function()
	require("configs.dap.ui").ui(dapui)
end

M.setup = function()
	require("configs.dap.addapters.javascript").adapter(dap)
	require("configs.dap.addapters.nodejs").adater(dap)
	require("configs.dap.addapters.python").adapter(dap)
	require("configs.dap.addapters.lua").adapter(dap)
end

return M
