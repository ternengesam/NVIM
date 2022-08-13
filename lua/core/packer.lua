local M = {}

M.options = {
	auto_clean = true,
	compile_on_sync = true,
	git = { clone_timeout = 6000 },
	display = {
		working_sym = "ﲊ",
		error_sym = "✗ ",
		done_sym = " ",
		removed_sym = " ",
		moved_sym = "",
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
}

M.run = function(plugins)
	local present, packer = pcall(require, "packer")
	if not present then
		return
	end
	packer.init(M.options)

	---
	local table = {}
	---
	--
	local disable = {}
	---

	for key, _ in pairs(plugins) do
		plugins[key][1] = key
		table[#table + 1] = plugins[key]
	end
	---
	for _, item in pairs(disable) do
		table = vim.tbl_deep_extend("force", table, { { item, disable = true } })
		--	print(vim.inspect(table))
	end
	return packer.startup(function(use)
		for _, value in pairs(table) do
			use(value)
		end
	end)
end
return M
