local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

local options = {
	ensure_installed = {
		"lua",
		"typescript",
		"javascript",
		"svelte",
		"python",
		"css",
		"json",
		"markdown",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
	autopairs = { enable = true },
	autotag = { enable = true, filetypes = { "jsx", "tsx", "html","javascriptreact","typescriptreact" } },
	incremental_selection = { enable = true },
	indent = { enable = true },
}
treesitter.setup(options)
