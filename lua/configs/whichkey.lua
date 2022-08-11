local present, wk = pcall(require, "which-key")

if not present then
	return
end

local options = {
	plugins = {
		spelling = { enable = true },
		presets = { operators = true },
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "  ", -- symbol used between a key and it's label
		group = "⬊ ", -- symbol prepended to a group
	},

	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},

	window = {
		border = "none", -- none/single/double/shadow
		padding = { 2, 2, 2, 2 },
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		align = "left",
		spacing = 6, -- spacing between columns
	},

	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	triggers = { "<leader>" },
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

wk.setup(options)
