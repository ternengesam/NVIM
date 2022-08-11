local wk_status, wk = pcall(require, "which-key")

if not wk_status then
	return
end

vim.g.mapleader = " "

local mappings = {
	n = {
		["<leader>"] = {
			f = { name = "File" },
			a = { name = "Aerial" },
			l = { name = "LSP" },
			p = { name = "Packer" },
		},
	},
}

local extras = {
	g = "Git",
	s = "Search",
	S = "Session",
	t = "terminal",
}
local function map_table(mode, prefix, idx)
	if not mappings[mode][prefix][idx] then
		mappings[mode][prefix][idx] = { name = extras[idx] }
	end
end

map_table("n", "<leader>", "S")
-- terminal
map_table("n", "<leader>", "t")
-- map telescope extras
map_table("n", "<leader>", "s")
map_table("n", "<leader>", "g")

mappings = vim.tbl_deep_extend("force", mappings, require("core.mappings"))

for mod, prefixs in pairs(mappings) do
	for pre, table in pairs(prefixs) do
		wk.register(table, {
			mode = mod,
			prefix = pre,
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = true,
		})
	end
end
