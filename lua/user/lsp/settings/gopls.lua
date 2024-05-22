local util = require "lspconfig/util"
local home = os.getenv "HOME"

return {
	-- cmd = {'gopls'},
	cmd = {home .. "/.local/share/nvim/mason/packages/gopls/gopls"},
	-- for postfix snippets and analyzers
	filetypes = {"go", "gomod", "gowork" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
				httpresponse = true,
			},
			completionDocumentation = true,
			-- Placeholder
			usePlaceholders = true,
			staticcheck = true,
			gofumpt = true,
		},
	},
}
