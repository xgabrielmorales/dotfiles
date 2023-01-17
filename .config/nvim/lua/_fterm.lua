require('FTerm').setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
vim.keymap.set('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')


-- Code Runner - execute commands in a floating terminal
local runners = { python = {'python', '-q'} }

vim.keymap.set('n', '<leader><Enter>', function()
    local buf = vim.api.nvim_buf_get_name(0)
    local ftype = vim.filetype.match({ filename = buf })
    local exec = runners[ftype]
    if exec ~= nil then
        require('FTerm').scratch({ cmd = exec })
    end
end)
