local fterm = require("FTerm")

fterm.setup({
  border = 'single',
  dimensions  = {
    width = 0.9,
    height = 0.9,
  },
})


-- Execute commands in a floating terminal
local lazygit = fterm:new({ cmd = 'lazygit' })

local runners = {
  python = { 'python', '-q' }
}

vim.keymap.set('n', '<leader><Enter>', function()
  local buf = vim.api.nvim_buf_get_name(0)
  local ftype = vim.filetype.match({ filename = buf })
  local exec = runners[ftype]
  if exec ~= nil then
    fterm.scratch({ cmd = exec })
  end
end)


-- keybindings
vim.keymap.set('n', '<leader>t', function() fterm.toggle() end)
vim.keymap.set('n', '<leader>G', function() lazygit:toggle() end)
