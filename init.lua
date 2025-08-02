vim.opt.shell = "C:/Program Files/Git/bin/bash.exe"
vim.opt.shellcmdflag = "-c"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
require("java_runner").setup()

require("core")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        { import = "plugins" },
        { import = "plugins.lsp" },
    },
    {
        checker = {
            enabled = true,
            notify = false,
        },
        change_detection = {
            notify = false,
        },
    }
)

