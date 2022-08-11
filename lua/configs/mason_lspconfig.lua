local present, masonlspconfig = pcall(require, "mason-lspconfig")

if not present then
  return
end

masonlspconfig.setup({
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
    "quick_lint_js",
    "jsonls",
    "marksman",
    "svelte",
    "html",
    "emmet_ls",
    "eslint",
    "cssls",
  },

  automatic_installation = true,
})
