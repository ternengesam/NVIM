local present, lspconfig = pcall(require, "lspconfig")

if not present then
	return
end

local M = {}

-- export on_attach & capabilities for custom lspconfigs
if not present then
  return
end

M.on_attach = function(client, bufnr)
  if vim.version().minor < 8 then
	  client.server_capabilities.document_formatting = false
	  client.server_capabilities.document_range_formatting= false
  else
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormatting = false
  end

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
	"rome",
	"svelte",
	"vimls",
	"tailwindcss",
	"cssmodules_ls",
	"pyright",
	"marksman",
	"jsonls",
	"emmet_ls",
	"cssls",
}

for _, lsp in ipairs(servers) do
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
