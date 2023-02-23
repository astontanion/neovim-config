require("nvim-treesitter.configs").setup {
	-- A list of parser names, or "all" (the four listed parsers should always be installed)
	ensure_installed = { "java", "kotlin", "typescript", "python", "lua", "vim", "help" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}
