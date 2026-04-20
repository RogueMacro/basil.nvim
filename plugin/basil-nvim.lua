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
				path = "~/Developer/tree-sitter-basil",
				generate = true,
				generate_from_json = false,
				queries = "queries/",
			},
			tier = 2,
		}
	end,
})
