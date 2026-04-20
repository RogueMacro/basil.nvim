require("mini.icons").setup({
	extension = {
		bl = { glyph = "󰌪", hl = "MiniIconsGreen" },
	},
})

vim.treesitter.language.register("basil", "bl")
vim.filetype.add({
	extension = {
		bl = "basil",
	},
	pattern = {
		["*.bl"] = { "basil", { priority = 10 } },
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		require("nvim-treesitter.parsers").basil = {
			install_info = {
				url = "https://github.com/RogueMacro/tree-sitter-basil",
				queries = "queries/",
			},
			tier = 2,
		}
	end,
})
