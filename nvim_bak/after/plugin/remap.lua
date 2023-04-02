local map = vim.api.nvim_set_keymap

-- Netrw remaps
map('n', '<leader>cv', ':Ex<CR>', {noremap = true, silent = false})
map('n', '<leader>scv', ':Vex<CR>', {noremap = true, silent = false})

-- Telescope remaps
map('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = false})
map('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = false})
map('n', '<leader>gc', ':Telescope git_commits<CR>', {noremap = true, silent = false})
map('n', '<leader>gb', ':Telescope git_branches<CR>', {noremap = true, silent = false})

-- Tab lines remaps
map('n', '<Tab>', '>>', {noremap = true, silent = false})
map('n', '<S-Tab>', '<<', {noremap = true, silent = false})

-- Navigation remaps
map('n', '<leader>-', ':bn<CR>', {noremap = true, silent = false})
map('n', '<leader>_', ':bp<CR>', {noremap = true, silent = false})
