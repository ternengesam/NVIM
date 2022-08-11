local ok, null_ls = pcall(require, "null-ls")

if not ok then
	return
end

local b = null_ls.builtins
local sources = {
	-- Set a formatter
	b.formatting.stylua,
	b.formatting.prettierd.with({
		extra_filetypes = { "svelte" },
	}),
	b.formatting.black,
	-- Set a linter
	b.diagnostics.eslint_d,
	b.diagnostics.luacheck,
	b.diagnostics.flake8,
	b.diagnostics.pylint,
	b.diagnostics.tsc,
	b.diagnostics.zsh,
	-- set for code actions
	b.code_actions.eslint_d,
	b.code_actions.gitsigns,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						timeout_ms = 5000,
						filter = function()
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
