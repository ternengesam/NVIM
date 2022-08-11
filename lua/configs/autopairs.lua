local status, npairs = pcall(require, "nvim-autopairs")

if not status then
	return
end

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		svelte = { "string", "template_string" },
	},
	disable_filetypes = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", "`", "'", '"', "<" },
		pattern = string.gsub([[ [%'%"%)%>%}%]%`] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		key = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

local cmp_status, cmp = pcall(require, "cmp")

if cmp_status then
	cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } }))
end
