local Others = {}

-- tabnine
Others.tabnine = function()
	local tabnine = require("cmp_tabnine.config")
	if tabnine then
		tabnine:setup({
			max_lines = 1000,
			max_num_results = 20,
			sort = true,
			run_on_every_keystroke = true,
			snippet_placeholder = "..",
			ignored_file_types = { -- default is not to ignore
				-- uncomment to ignore in lua:
				-- lua = true
			},
			show_prediction_strength = false,
		})
	end
end

-- colorizer
Others.colorizer = function()
	local status_ok, colorizer = pcall(require, "colorizer")
	if not status_ok then
		return
	end
	local opts = {
		{ "*" },
		{
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = false, -- "Name" codes like Blue
			RRGGBBAA = false, -- #RRGGBBAA hex codes
			rgb_fn = false, -- CSS rgb() and rgba() functions
			hsl_fn = false, -- CSS hsl() and hsla() functions
			css = false, -- Enable all css features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			mode = "background", -- Set the display mode
		},
	}
	colorizer.setup(opts[1], opts[2])
end

-- dressing
Others.dressing = function()
	local status_ok, dressing = pcall(require, "dressing")
	if not status_ok then
		return
	end
	-- TODO: Deprecate user ui options table with v2
	dressing.setup({
		input = {
			enabled = true,
			default_prompt = "➤ ",
			winhighlight = "Normal:Normal,NormalNC:Normal",
		},
		select = {
			enabled = true,
			backend = { "telescope", "builtin" },
			builtin = { winhighlight = "Normal:Normal,NormalNC:Normal" },
		},
	})
end

--git signs
Others.gitsigns = function()
	local status_ok, gitsigns = pcall(require, "gitsigns")
	if not status_ok then
		return
	end
	gitsigns.setup({
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "▎" },
			topdelete = { text = "契" },
			changedelete = { text = "▎" },
		},
	})
end

-- notify
Others.notify = function()
	local status_ok, notify = pcall(require, "notify")
	if not status_ok then
		return
	end
	notify.setup({ stages = "fade" })
	vim.notify = notify
end

---smartsplits
--
Others.smartsplits = function()
	local status_ok, smart_splits = pcall(require, "smart-splits")
	if not status_ok then
		return
	end
	smart_splits.setup({
		ignored_filetypes = {
			"nofile",
			"quickfix",
			"qf",
			"prompt",
		},
		ignored_buftypes = { "nofile" },
	})
end

--mason
Others.mason = function()
	local present, mason = pcall(require, "mason")

	if not present then
		return
	end

	mason.setup()
end

--terminal
Others.terminal = function()
	local status_ok, toggleterm = pcall(require, "toggleterm")
	if status_ok then
		return toggleterm.setup({
			size = 10,
			open_mapping = [[<c-\>]],
			shading_factor = 2,
			direction = "float",
			float_opts = {
				border = "curved",
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
	end
end

--scrollbar
Others.scrollbar = function()
	local status, scb = pcall(require, "scrollbar")
	if status then
		scb.setup()
	end
end

-- hop
Others.hop = function()
	local status, hop = pcall(require, "hop")
	if status then
		hop.setup()
	end
end

--project
  Others.project = function()
	  local status, project = pcall(require, "nvim_project")
	if status then
		project.setup()
	end
end

-- return global
return Others
