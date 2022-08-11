vim.cmd("packadd packer.nvim")

local plugins = {
	-- Plugin manager
	["wbthomason/packer.nvim"] = {},

	-- Optimiser
	["lewis6991/impatient.nvim"] = {},

	-- Lua functions
	["nvim-lua/plenary.nvim"] = { module = "plenary" },

	-- Cursorhold fix
	["antoinemadec/FixCursorHold.nvim"] = {
		event = { "BufRead", "BufNewFile" },
		config = function()
			vim.g.cursorhold_updatetime = 100
		end,
	},

	-- Smarter Splits
	["mrjones2014/smart-splits.nvim"] = {
		module = "smart-splits",
		config = function()
			require("configs.others").smartsplits()
		end,
	},

	-- Icons
	["kyazdani42/nvim-web-devicons"] = {
		module = "nvim-web-devicons",
		config = function()
			require("configs.icons")
		end,
	},

	-- LSP Icons
	["onsails/lspkind.nvim"] = { module = "lspkind" },

	-- File explorer
	["kyazdani42/nvim-tree.lua"] = {
		config = function()
			require("configs.nvimtree")
		end,
	},

	--ui for file oprations
	["stevearc/dressing.nvim"] = {
		config = function()
			require("configs.others").dressing()
		end,
	},

	-- Parenthesis highlighting
	["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

	-- Autoclose tags
	["windwp/nvim-ts-autotag"] = {
		after = "nvim-treesitter",
	},

	-- Context based commenting
	["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

	-- Syntax highlighting
	["nvim-treesitter/nvim-treesitter"] = {
		run = ":TSUpdate",
		event = { "BufRead", "BufNewFile" },
		cmd = {
			"TSInstall",
			"TSInstallInfo",
			"TSInstallSync",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSDisableAll",
			"TSEnableAll",
		},
		config = function()
			require("configs.treesitter")
		end,
	},

	-- lsp saga

	["glepnir/lspsaga.nvim"] = {
		branch = "main",
		config = function()
			require("configs.lspsaga")
		end,
	},
	-- Snippet collection
	["rafamadriz/friendly-snippets"] = { opt = true },

	-- Snippet engine
	["L3MON4D3/LuaSnip"] = {
		module = "luasnip",
		wants = "friendly-snippets",
		config = function()
			require("configs.luasnip")
		end,
	},

	-- Completion engine
	["hrsh7th/nvim-cmp"] = {
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
	},

	-- Snippet completion source
	["saadparwaiz1/cmp_luasnip"] = {
		after = "nvim-cmp",
	},

	-- Buffer completion source
	["hrsh7th/cmp-buffer"] = {
		after = "nvim-cmp",
	},

	-- Path completion source
	["hrsh7th/cmp-path"] = {
		after = "nvim-cmp",
	},

	-- LSP completion source
	["hrsh7th/cmp-nvim-lsp"] = {
		after = "nvim-cmp",
	},

	-- tabnine source
	["tzachar/cmp-tabnine"] = {
		module = "tabnine",
		after = "nvim-cmp",
		run = "./install.sh",
		config = function()
			require("configs.others").tabnine()
		end,
	},

	-- Package Manager
	["williamboman/mason.nvim"] = {
		config = function()
			require("configs.others").mason()
		end,
	},

	-- Built-in LSP
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- LSP manager
	["williamboman/mason-lspconfig.nvim"] = {
		after = { "mason.nvim", "nvim-lspconfig" },
		config = function()
			require("configs.mason_lspconfig")
		end,
	},

	-- signature help provider
	["ray-x/lsp_signature.nvim"] = {},

	-- LSP symbols

	["stevearc/aerial.nvim"] = {
		module = "aerial",
		cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
		config = function()
			require("configs.aerial")
		end,
	},

	-- Formatting and linting
	["jose-elias-alvarez/null-ls.nvim"] = {
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("configs.null_ls")
		end,
	},

	-- Fuzzy finder
	["nvim-telescope/telescope.nvim"] = {
		cmd = "Telescope",
		module = "telescope",
		config = function()
			require("configs.telescope")
		end,
	},

	-- Fuzzy finder syntax support

	-- Git integration
	["lewis6991/gitsigns.nvim"] = {
		event = "BufEnter",
		config = function()
			require("configs.others").gitsigns()
		end,
	},

	-- Color highlighting
	["NvChad/nvim-colorizer.lua"] = {
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("configs.others").colorizer()
		end,
	},

	-- Autopairs
	["windwp/nvim-autopairs"] = {
		event = "InsertEnter",
		config = function()
			require("configs.autopairs")
		end,
	},

	-- Terminal
	["akinsho/toggleterm.nvim"] = {
		tag = "v2.*",
		config = function()
			require("configs.others").terminal()
		end,
	},

	-- Commenting
	["numToStr/Comment.nvim"] = {
		module = { "Comment", "Comment.api" },
		keys = { "gc", "gb", "g<", "g>" },
		config = function()
			require("configs.comment")
		end,
	},

	-- Indentation
	["lukas-reineke/indent-blankline.nvim"] = {
		event = "BufRead",
		config = function()
			require("configs.indent-line")
		end,
	},

	-- Keymaps popup
	["folke/which-key.nvim"] = {
		module = "which-key",
		config = function()
			require("configs.whichkey")
		end,
	},

	-- Smooth scrolling
	["declancm/cinnamon.nvim"] = {
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("cinnamon").setup()
		end,
	},

	-- Smooth escaping
	["max397574/better-escape.nvim"] = {
		event = "InsertCharPre",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- Get extra JSON schemas
	["b0o/SchemaStore.nvim"] = { module = "schemastore" },

	--lua dev tool
	["rafcamlet/nvim-luapad"] = {
		config = function()
			require("luapad").setup()
		end,
	},

	-- gruvbox theme
	["ellisonleao/gruvbox.nvim"] = {},

	--sonokai theme
	["sainnhe/sonokai"] = {},
	-- night fly

	["bluz71/vim-nightfly-guicolors"] = {},
	---
	["folke/tokyonight.nvim"] = {},

	-- auto save
	["907th/vim-auto-save"] = {
		config = function()
			vim.g.auto_save = 1
		end,
	},

	["nvim-lualine/lualine.nvim"] = {
		config = function()
			require("configs.lualine")
		end,
	},

	-- ui/bufferline
	["akinsho/bufferline.nvim"] = {
		tag = "v2.*",
		config = function()
			require("configs.bufferline")
		end,
	},
}
require("core.packer").run(plugins)
