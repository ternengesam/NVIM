local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
	impatient.enable_profile()
end

for _, source in ipairs({
	"core.options",
	"core.mappings",
	"core.plugins",
	"core.autocmds",
	"configs.lazygit",
	"configs.whichkey-register",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end

-- setup packer + plugins
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
	print("Cloning packer ..")
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })

	-- install plugins + compile their configs
	vim.cmd("packadd packer.nvim")
	require("core.plugins")
	vim.cmd("PackerSync")
end

vim.api.nvim_create_user_command("SourceConfigs", function()
	local path = "~/.config/nvim/**/*.lua"
	vim.cmd("source! ", path)
end, {})
