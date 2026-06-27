local ok, icons = pcall(require, "mini.icons")
if ok then
	icons.setup({
		extension = {
			bl = { glyph = "󰌪", hl = "MiniIconsGreen" },
		},
	})
end

vim.treesitter.language.register("basil", "bl")
vim.filetype.add({
	extension = {
		bl = "basil",
	},
	pattern = {
		["*.bl"] = { "basil", { priority = 10 } },
	},
})

local ok, treeman = pcall(require, "tree-sitter-manager")
if ok then
	treeman.setup({
		languages = {
			basil = {
				install_info = {
					url = "https://github.com/roguemacro/tree-sitter-basil",
					-- revision = "f82709883cc6c111ae39ce1303162415641c949e",
					queries = "queries/",
					use_repo_queries = true,
				},
			},
		},
	})
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "basil",
	callback = function()
		vim.bo.commentstring = "// %s"
	end,
})
