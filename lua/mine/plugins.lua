local ensure_packer = function()
	local fn = vim.fn

	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end

	return false
end

local packer_bootstrap = ensure_packer()

local is_success, packer = pcall(require, "packer")

if not is_success then
	return
end

return packer.startup(
function(use)
	use("wbthomason/packer.nvim")
	use("NTBBLoodbath/doom-one.nvim")
	use("EdenEast/nightfox.nvim")
	use({
		"rose-pine/neovim",
		as = "rose-pine"
	})
	use({
		"rstacruz/vim-closer",
		ft = {"jav", "kt", "ts", "js", "jsx", "lua"}
	})
	use({
		"folke/which-key.nvim",
		config = function()
			vim.opt.timeout = true
			vim.opt.timeoutlen = 1000
			require("which-key").setup({
				plugins = {
					marks = false,
					registers = false
				},
				window = {
					boarder = "single",
					position = "bottom",
					margin = { 1, 0, 1, 0 },
					pading = { 1, 1, 1, 1 },
				},
				layout = {
					height = { min = 1, max = 2 },
					width = { min = 20, max = 50 },
					spacing = 3,
					align = "left"
				}
			})
		end
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } }
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim"
		}
	})
	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	})
	if packer_bootstrap then
		require("packer").sync()
	end
end
)
