local function map(m, k, v)
	vim.keymap.set(m, k, v, {silent = true})
end

vim.g.mapleader = " "
map("n", "<leader>pv", "<CMD>Ex<CR>")
