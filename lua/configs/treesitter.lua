local present, treesitter = pcall(require, "nvim-treesitter.configs")
local tag_status, autotag = pcall(require, "autotag")
if not (present and tag_status) then
	return
end

autotag.setup({})
local options = {
	ensure_installed = {
		"lua",
		"typescript",
		"javascript",
		"svelte",
		"python",
		"css",
		"json",
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
	autotag = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = false },
}

treesitter.setup(options)
