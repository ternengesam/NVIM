local present, bl = pcall(require, "bufferline")
if present then
	bl.setup({
		options = {
			numbers = "none",
			close_command = "bdelete! %d",
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = true,
			color_icons = true,
			offsets = {
				{
					filetype = "NvimTree",
					text = "FILE EXPLORER",
					text_align = "center",
					show_buffer_icons = true,
					show_buffer_close_icon = true,
					show_close_icon = true,
					show_tab_indicator = true,
					separator_style = "thin",
					bg = "blue",
				},
			},
		},
	})
end
