vim.cmd("packadd packer.nvim")

local plugins = {
	-- Plugin manager
	["wbthomason/packer.nvim"] = {},

	-- Optimiser
	["lewis6991/impatient.nvim"] = {},

	-- Lua functions
	["nvim-lua/plenary.nvim"] = { module = "plenary" },
	-- notification
	["rcarriga/nvim-notify"] = {
		config = function()
			require("configs.others").notify()
		end,
	},

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
		event = { "BufRead", "BufEnter" },
		config = function()
			require("configs.others").smartsplits()
		end,
	},

	-- Icons
	["kyazdani42/nvim-web-devicons"] = {
		module = "nvim-web-devicons",
	},

	-- LSP Icons
	["onsails/lspkind.nvim"] = { module = "lspkind", event = "InsertEnter" },

	-- File explorer
	["kyazdani42/nvim-tree.lua"] = {
		event = "BufEnter",
		config = function()
			require("configs.nvimtree")
		end,
	},

	--ui for file oprations
	["stevearc/dressing.nvim"] = {
		event = { "BufEnter", "BufAdd", "BufDelete" },
		config = function()
			require("configs.others").dressing()
		end,
	},

	-- Parenthesis highlighting
	["p00f/nvim-ts-rainbow"] = { wants = "nvim-treesitter", event = "BufEnter" },

	-- Autoclose tags
	["windwp/nvim-ts-autotag"] = {
		wants = "nvim-treesitter",
		ft = { "jsx", "tsx", "html" },
		event = "InsertEnter",
	},

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

	-- Snippet collection
	["rafamadriz/friendly-snippets"] = { event = "InsertEnter" },

	-- Snippet engine
	["L3MON4D3/LuaSnip"] = {
		module = "luasnip",
		event = "InsertEnter",
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
		event = "InsertEnter",
	},

	--treesitter sorce
	["ray-x/cmp-treesitter"] = { after = "nvim-cmp" },

	["RRethy/nvim-treesitter-endwise"] = {
		wants = "nvim-treesitter",
		event = "InsertEnter",
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
		event = "BufEnter",
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
	["ray-x/lsp_signature.nvim"] = { event = "InsertEnter" },

	-- LSP symbols

	["stevearc/aerial.nvim"] = {
		module = "aerial",
		event = "BufEnter",
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
		event = "BufEnter",
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
	--alpa
	["goolord/alpha-nvim"] = {
		config = function()
			require("configs.alpha")
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
		cmd = "ToggleTerm",
		opt = true,
		event = "BufEnter",
		config = function()
			require("configs.others").terminal()
		end,
	},

	-- Commenting
	["numToStr/Comment.nvim"] = {
		event = "BufEnter",
		module = { "Comment", "Comment.api" },
		keys = { "gc", "gb", "g<", "g>" },
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
		event = "BufEnter",
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

	--scrollbar
	["petertriho/nvim-scrollbar"] = {
		event = "BufEnter",
		requires = { { "kevinhwang91/nvim-hlslens", opt = true } },
		config = function()
			require("configs.others").scrollbar()
		end,
	},

	-- hop
	["phaazon/hop.nvim"] = {
		event = "BufEnter",
		branch = "v2",
		config = function()
			require("configs.others").hop()
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
	["b0o/SchemaStore.nvim"] = { module = "schemastore", event = "InsertEnter", ft = "json" },

	--one dark
	["Mofiqul/dracula.nvim"] = {},
	-- auto save
	["907th/vim-auto-save"] = {
		event = "InsertEnter",
		config = function()
			vim.g.auto_save = 1
		end,
	},

	--lualine
	["nvim-lualine/lualine.nvim"] = {
		event = "BufEnter",
		config = function()
			require("configs.lualine")
		end,
	},

	-- ui/bufferline
	["akinsho/bufferline.nvim"] = {
		event = "BufEnter",
		tag = "v2.*",
		config = function()
			require("configs.bufferline")
		end,
	},

	-- debuging
	["mfussenegger/nvim-dap"] = {
		disable = false,
		opt = true,
		cmd = { "DapToggleBreakpoint", "DapToggleRepl", "DapContinue" },
		config = function()
			require("configs.dap").setup()
		end,
	},
	-- lua adapter
	["jbyuki/one-small-step-for-vimkind"] = {
		disable = false,
		ft = "lua",
		after = "nvim-dap",
	},

	--python adapter
	["mfussenegger/nvim-dap-python"] = {
		ft = "python",
		after = "nvim-dap",
		config = function()
			require("configs.dap").py()
		end,
	},

	-- javascript adapter
	["mxsdev/nvim-dap-vscode-js"] = {
		wants = "nvim-dap",
		after = "nvim-dap",
		ft = { "javascript", "jsx", "typescript", "tsx" },
		disable = false,
	},

	["microsoft/vscode-js-debug"] = {
		commit = "c75e8d5",
		opt = true,
		event = "BufEnter",
		ft = { "javascript", "jsx", "typescript", "tsx" },
		run = "npm install --legacy-peer-deps && npm run compile",
	},

	-- debugger ui
	["rcarriga/nvim-dap-ui"] = {
		after = "nvim-dap",
	},
}
require("core.packer").run(plugins)
