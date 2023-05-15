local status_ok, navic = pcall(require, "navic")
if not status_ok then
  return
end

navic.setup({})
