vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local tree_status, tree = pcall(require, "nvim-tree")

if not tree_status then
	return
end

tree.setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	}
})

local key_status, which_key = pcall(require, "which-key")

if not key_status then
	return
end

local tree_keys = {
	name = "tree",
	t = { ":NvimTreeToggle<CR>", "open" },
}

local mappings = {
	t = tree_keys 
}

local options = {
	mode = "n",
	prefix = "<leader>",
	silent = true,
	noremap = true
}

which_key.register(mappings, options)

