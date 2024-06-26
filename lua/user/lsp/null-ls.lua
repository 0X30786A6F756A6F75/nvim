local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.black.with { extra_args = { "--fast" } },
    -- Uncomment and add other formatters and diagnostics if needed
    -- formatting.prettier.with {
    --   extra_filetypes = { "toml", "solidity" },
    --   extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    -- },
    -- formatting.eslint,
    -- formatting.stylua,
    -- formatting.shfmt,
    -- formatting.google_java_format,
    -- diagnostics.shellcheck,
    -- diagnostics.twigcs,
  },
})

-- Custom Rust diagnostics for unwrap usage
local unwrap = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "rust" },
  generator = {
    fn = function(params)
      local diagnostics = {}
      for i, line in ipairs(params.content) do
        local col, end_col = line:find("unwrap()")
        if col and end_col then
          table.insert(diagnostics, {
            row = i,
            col = col,
            end_col = end_col,
            source = "unwrap",
            message = "Hey " .. os.getenv("USER") .. ", don't forget to handle this",
            severity = 2,
          })
        end
      end
      return diagnostics
    end,
  },
}

null_ls.register(unwrap)

