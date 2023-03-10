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
		use("nvim-lua/plenary.nvim")
		use("NTBBLoodbath/doom-one.nvim")
		use("navarasu/onedark.nvim")
		use("EdenEast/nightfox.nvim")
		use("arcticicestudio/nord-vim")
		use({
			"rose-pine/neovim",
			as = "rose-pine"
		})
		use({
			"rstacruz/vim-closer",
			ft = {"java", "kt", "ts", "js", "jsx", "lua"}
		})
		use({
			"folke/which-key.nvim",
			config = function()
				vim.opt.timeout = true
				vim.opt.timeoutlen = 300
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
		use("nvim-telescope/telescope-ui-select.nvim")
		use({
			"nvim-telescope/telescope-file-browser.nvim",
			requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate"
		})
		--use("kyazdani42/nvim-web-devicons")
		use({
			'nvim-tree/nvim-tree.lua',
	  		tag = 'nightly' -- optional, updated every week. (see issue #1193)
		})
		use("nvim-tree/nvim-web-devicons")
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true }
		})

		-- autocompletion
		use("/hrsh7th/nvim-cmp")
		use("/hrsh7th/cmp-buffer")
		use("/hrsh7th/cmp-path")

		-- lsp
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")
		use("neovim/nvim-lspconfig")
		use("hrsh7th/cmp-nvim-lsp")
		use({
			"glepnir/lspsaga.nvim",
			branch = "main"
		})
		use("mfussenegger/nvim-jdtls")
		use("jose-elias-alvarez/typescript.nvim")
		use("onsails/lspkind.nvim")

		if packer_bootstrap then
			require("packer").sync()
		end
	end
)
