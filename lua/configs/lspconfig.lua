local present, lspconfig = pcall(require, "lspconfig")

if not present then
	return
end

local M = {}

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	if client.server_capabilities.signatureHelpProvider then
		require("lsp_signature").setup(client, bufnr)
	end
	require("aerial").on_attach(client, bufnr)
end

M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}
local servers = {
	"html",
	"tsserver",
	"svelte",
	"vimls",
	"tailwindcss",
	"cssmodules_ls",
	"pyright",
	"rome",
	"quick_lint_js",
	"pylsp",
	"marksman",
	"jsonls",
	"emmet_ls",
	"cssls",
}

for _, lsp in ipairs(servers) do
	if lsp == "tsserver" then
		lspconfig.tsserver.setup({
			on_attach = M.on_attach,
			filetypes = {
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
			},
			cmd = { "typescript-language-server", "--stdio" },
			capabilities = M.capabilities,
		})
	end
	lspconfig[lsp].setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	})
end
lspconfig.sumneko_lua.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

return M
