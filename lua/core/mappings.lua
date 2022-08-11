local maps = { n = {}, v = {}, t = {}, [""] = {} }

maps[""]["<Space>"] = "<Nop>"

-- Normal --
-- Standard Operations
maps.n["<leader>w"] = { "<cmd>w<cr>", "Save" }
maps.n["<leader>q"] = { "<cmd>q<cr>", "Quit" }
maps.n["<leader>h"] = { "<cmd>nohlsearch<cr>", "No Highlight" }
maps.n["<leader>fn"] = { "<cmd>enew<cr>", "New File" }

maps.n["<C-s>"] = { "<cmd>w!<cr>", "Force write" }
maps.n["<C-q>"] = { "<cmd>q!<cr>", "Force quit" }
maps.n["Q"] = "<Nop>"

-- Packer
maps.n["<leader>pc"] = { "<cmd>PackerCompile<cr>", "Packer Compile" }
maps.n["<leader>pi"] = { "<cmd>PackerInstall<cr>", "Packer Install" }
maps.n["<leader>ps"] = { "<cmd>PackerSync<cr>", "Packer Sync" }
maps.n["<leader>pS"] = { "<cmd>PackerStatus<cr>", "Packer Status" }
maps.n["<leader>pu"] = { "<cmd>PackerUpdate<cr>", "Packer Update" }

-- Bufdelete
maps.n["<leader>c"] = { "<cmd>Bdelete<cr>", "Close window" }

-- Navigate buffers
maps.n["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer tab" }
maps.n["<S-<Tab>>"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer tab" }
maps.n[">b"] = { "<cmd>BufferLineMoveNext<cr>", "Move buffer tab left" }

-- Comment
maps.n["<leader>/"] = {
	function()
		require("Comment.api").toggle_current_linewise()
	end,
	"Comment line",
}
maps.v["<leader>/"] = {
	"<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>",
	"Toggle comment line",
}

-- Explorer
maps.n["<leader>e"] = { "<cmd>NvimTreeToggle <cr>", "Toggle Explorer" }
maps.n["<leader>o"] = { "<cmd>NvimTreeFocus <cr>", "Focus Explorer" }

-- Package Manager

maps.n["<leader>pI"] = { "<cmd>Mason<cr>", "Mason Update" }

-- LSP Installer
maps.n["<leader>li"] = { "<cmd>LspInfo<cr>", "Move to left split" }
maps.n["<C-j>"] = {
	function()
		require("smart-splits").move_cursor_down()
	end,
	"Move to below split",
}
maps.n["<C-k>"] = {
	function()
		require("smart-splits").move_cursor_up()
	end,
	"Move to above split",
}
maps.n["<C-l>"] = {
	function()
		require("smart-splits").move_cursor_right()
	end,
	"Move to right split",
}

-- Resize with arrows
maps.n["<C-Up>"] = {
	function()
		require("smart-splits").resize_up()
	end,
	"Resize split up",
}
maps.n["<C-Down>"] = {
	function()
		require("smart-splits").resize_down()
	end,
	"Resize split down",
}
maps.n["<C-Left>"] = {
	function()
		require("smart-splits").resize_left()
	end,
	"Resize split left",
}
maps.n["<C-Right>"] = {
	function()
		require("smart-splits").resize_right()
	end,
	"Resize split right",
}

maps.n["<C-h>"] = { "<C-w>h", "Move to left split" }
maps.n["<C-j>"] = { "<C-w>j", "Move to below split" }
maps.n["<C-k>"] = { "<C-w>k", "Move to above split" }
maps.n["<C-l>"] = { "<C-w>l", "Move to right split" }
maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", "Resize split up" }
maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", "Resize split down" }
maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", "Resize split left" }
maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", "Symbols outline" }

-- Telescope
maps.n["<leader>fw"] = {
	function()
		require("telescope.builtin").live_grep()
	end,
	"Search words",
}
maps.n["<leader>fW"] = {
	function()
		require("telescope.builtin").live_grep({
			additional_args = function(args)
				return vim.list_extend(args, { "--hidden", "--no-ignore" })
			end,
		})
	end,
	"Search words in all files",
}
maps.n["<leader>gt"] = {
	function()
		require("telescope.builtin").git_status()
	end,
	"Git status",
}
maps.n["<leader>gb"] = {
	function()
		require("telescope.builtin").git_branches()
	end,
	"Git branches",
}
maps.n["<leader>gc"] = {
	function()
		require("telescope.builtin").git_commits()
	end,
	"Git commits",
}

-- lazy git
maps.n["<leader>gg"] = { "<cmd>Lazygit<cr>", "lazygit" }

maps.n["<leader>ff"] = {
	function()
		require("telescope.builtin").find_files()
	end,
	"Search files",
}
maps.n["<leader>fF"] = {
	function()
		require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
	end,
	"Search all files",
}
maps.n["<leader>fb"] = {
	function()
		require("telescope.builtin").buffers()
	end,
	"Search buffers",
}
maps.n["<leader>fh"] = {
	function()
		require("telescope.builtin").help_tags()
	end,
	"Search help",
}
maps.n["<leader>fm"] = {
	function()
		require("telescope.builtin").marks()
	end,
	"Search marks",
}
maps.n["<leader>fo"] = {
	function()
		require("telescope.builtin").oldfiles()
	end,
	"Search history",
}
maps.n["<leader>fc"] = {
	function()
		require("telescope.builtin").grep_string()
	end,
	"Search for word under cursor",
}
maps.n["<leader>sb"] = {
	function()
		require("telescope.builtin").git_branches()
	end,
	"Git branches",
}
maps.n["<leader>sh"] = {
	function()
		require("telescope.builtin").help_tags()
	end,
	"Search help",
}
maps.n["<leader>sm"] = {
	function()
		require("telescope.builtin").man_pages()
	end,
	"Search man",
}
maps.n["<leader>sn"] = {
	function()
		require("telescope").extensions.notify.notify()
	end,
	"Search notifications",
}
maps.n["<leader>sr"] = {
	function()
		require("telescope.builtin").registers()
	end,
	"Search registers",
}
maps.n["<leader>sk"] = {
	function()
		require("telescope.builtin").keymaps()
	end,
	"Search keymaps",
}
maps.n["<leader>sc"] = {
	function()
		require("telescope.builtin").commands()
	end,
	"Search commands",
}
maps.n["<leader>ls"] = {
	function()
		local aerial_avail, _ = pcall(require, "aerial")
		if aerial_avail then
			require("telescope").extensions.aerial.aerial()
		else
			require("telescope.builtin").lsp_document_symbols()
		end
	end,
	"Search symbols",
}
maps.n["<leader>lR"] = {
	function()
		require("telescope.builtin").lsp_references()
	end,
	"Search references",
}
maps.n["<leader>lD"] = {
	function()
		require("telescope.builtin").diagnostics()
	end,
	"Search diagnostics",
}

-- Terminal
maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", "ToggleTerm float" }
maps.n["<leader>tt"] = { "<cmd>ToggleTerm size=10 direction=tab<cr>", "ToggleTerm in new tab" }
maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=horizontal<cr>", "ToggleTerm horizontal split" }

-- Stay in indent mode
maps.v["<"] = { "<gv", "indent line" }

-- Improved Terminal Navigation
maps.t["<C-h>"] = { "<c-\\><c-n><c-w>h", "Terminal left window navigation" }
maps.t["<C-j>"] = { "<c-\\><c-n><c-w>j", "Terminal down window navigation" }
maps.t["<C-k>"] = { "<c-\\><c-n><c-w>k", "Terminal up window navigation" }
maps.t["<C-l>"] = { "<c-\\><c-n><c-w>l", "Terminal right window naviation" }

maps.n["<leader><leader>"] = { "<cmd> SourceConfigs<cr>", "Source config files" }
return maps
