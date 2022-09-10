vim.api.nvim_set_keymap('n', '<C-p>', ":lua require('telescope.builtin').find_files()<CR>", { noremap = true, })
vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<CR>", {noremap = true})
