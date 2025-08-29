local M = {}

function M.setup()
  vim.api.nvim_create_user_command("RunJava", function()
    local filepath = vim.fn.expand("%:p")
    local filename = vim.fn.expand("%:t")
    local classname = vim.fn.expand("%:t:r")
    local filedir = vim.fn.expand("%:p:h")

    vim.cmd("w") -- save before running

    -- On Linux, just use sh instead of powershell
    local cmd = string.format(
      "cd '%s' && javac '%s' && java %s",
      filedir,
      filename,
      classname
    )

    vim.cmd("botright split | resize 12 | terminal " .. cmd)
  end, {})

  vim.keymap.set("n", "<leader>rj", "<cmd>RunJava<CR>", {
    desc = "Compile & Run Java",
    noremap = true,
    silent = true
  })
end

return M

