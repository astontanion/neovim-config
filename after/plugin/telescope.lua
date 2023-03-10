local which_key_status, which_key = pcall(require, "which-key")

if not which_key_status then
	return
end

local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
	return
end

local has_builtin, builtin = pcall(require, "telescope.builtin")

if not has_builtin then
	return
end

local file_browser = telescope.extensions.file_browser
local file_browser_actions = file_browser.actions

telescope.setup({
	defaults = {
		path_display = {
			sorten = {
				len = 3,
				exclude = { 1, -1 },
			},
			truncate = true
		},
		dynamic_preview_title = true
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
					["<C-n>"] = file_browser_actions.create,
				},
				["n"] = {
					-- your custom normal mode mappings
					--["<C-d>"] = file_browser_actions.remove,
					--["<C-m>"] = file_browser_actions.move,
					--["<C-c>"] = file_browser_actions.copy
				},
			},
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown {}
		}
	}
})

telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

local file_keys = {
	name = "File",
	c = { file_browser_actions.create_from_prompt, "Create" },
	e = { ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "Explore" },
	s = { builtin.find_files, "Search" },
}

local buffer_keys = {
	name = "Buffer",
	s = { builtin.buffers, "Search"},
}

local search_keys = {
	name = "Search",
	s = { builtin.live_grep, "Fuzzy" },
	g = { builtin.git_files, "In git" },
}

local mappings = {
	s = search_keys,
	f = file_keys,
	b = buffer_keys
}

local options = {
	mode = "n",
	prefix = "<leader>",
	silent = true,
	noremap = true
}

which_key.register(mappings, options)
