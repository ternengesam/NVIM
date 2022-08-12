local ui = function(dapui)
	dapui.setup({
		floating = {
			max_height = 0.25,
			max_width = 25,
			border = "rounded",
		},
	})
end
return { ui = ui}
