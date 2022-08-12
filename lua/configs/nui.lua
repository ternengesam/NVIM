local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local popup_opts = {
	position = "70%",
	size = { width = 40 },
	border = {
		style = "rounded",
		text = {
			top = "[enter element id]",
			top_align = "center",
		},
	},
	win_options = {
		winhighlight = "Normal:Normal, FloatBoarder:Normal",
	},
}

local input = Input(popup_opts, {
	prompt = "> ",
	default_value = "ids = (repl,console,breakpoints,watches,stacks,scopes)",
	on_close = function()
		vim.notify("dapui float window active")
	end,
	on_submit = function(value)
		assert(value, "element id is required")
		vim.notify(value)
	end,
})
input:mount()
return { input = input }
