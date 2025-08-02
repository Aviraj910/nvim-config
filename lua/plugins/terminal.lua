return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",       -- shows terminal as a floating window
        close_on_exit = false,     -- keeps terminal open after running command
      })
    end,
  },
}

