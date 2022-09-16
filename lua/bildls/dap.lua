require("dapui").setup();
vim.api.nvim_set_keymap('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", {silent=true, noremap=true});
vim.api.nvim_set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", {silent=true, noremap=true});


local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end



vim.api.nvim_set_keymap('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", {silent=true, noremap=true});
vim.api.nvim_set_keymap('n', '<leader>dd', ":lua require'dap'.disconnect()<CR>", {silent=true, noremap=true});
vim.api.nvim_set_keymap('n', '<Up>', ":lua require'dap'.continue()<CR>", {silent=true, noremap=true});
vim.api.nvim_set_keymap('n', '<Right>', ":lua require'dap'.step_into()<CR>", {silent=true, noremap=true});
vim.api.nvim_set_keymap('n', '<Down>', ":lua require'dap'.step_over()<CR>", {silent=true, noremap=true});
vim.api.nvim_set_keymap('n', '<Left>', ":lua require'dap'.step_out()<CR>", {silent=true, noremap=true});
vim.api.nvim_set_keymap('n', '<leader>', ":lua require'dap'.step_out()<CR>", {silent=true, noremap=true});



require('dap-go').setup()


