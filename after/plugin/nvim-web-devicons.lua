local icons_status, icons = pcall(require, "nvim-web-devicons")

if not icons_status then
	return
end

icons.setup({})
