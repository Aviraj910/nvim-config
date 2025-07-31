return {
	"nvim-telescope/telescope.nvim",
	branch = "master", -- use '0.1.x' for stable version if preferred
	dependencies = {
		"nvim-lua/plenary.nvim",
	{
  "Aviraj910/telescope-fzf-native.nvim",
  build = function()
    vim.fn.system({
      "cmake",
      "-S", ".", "-B", "build",
      "-DCMAKE_BUILD_TYPE=Release",
      "-G", "MinGW Makefiles",
    })
    vim.fn.system({
      "cmake", "--build", "build", "--config", "Release"
    })
  end,
},
        "nvim-tree/nvim-web-devicons",
		"andrew-george/telescope-themes",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				themes = {
					enable_previewer = true,
					enable_live_preview = true,
					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
					},
				},
			},
		})

		-- ✅ Load extensions after setup
		telescope.load_extension("fzf")
		telescope.load_extension("themes")

		-- 🔑 Keymaps
		vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Find Connected Words under cursor" })
		vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
	end,
}

