local util = require "lspconfig/util"

return {
	cmd = {'gopls'},
	-- for postfix snippets and analyzers
	filetypes = {"go", "gomod", "gowork", "gotmpl", "tmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			usePlaceholders = true,
			-- experimentalPostfixCompletions = false,
			analyses = {
				unusedparams = true,
				shadow = true,
				httpresponse = true,
				tests = true,
		 },
		 staticcheck = true,
		},
	},
}
