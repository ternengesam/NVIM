local term_ok, Terminal = pcall(require, "toggleterm.terminal")

if not term_ok then
	return
end

local lazygit = Terminal.Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	close_on_exit = true,
	float_opts = { border = "rounded" },
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
	end,
	on_close = function()
		vim.cmd("exit")
	end,
})

vim.api.nvim_create_user_command("Lazygit", function()
	lazygit:toggle()
end, {})
