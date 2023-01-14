return {
  default_config = {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
  },
  settings = {
    intelephense = {
      validation = {
        run = "onType",
      },
      completion = {
        triggerParameterHints = true,
      },
      globalStoragePath = "/tmp/intelephense",
      telemetry = {
        enable = false,
      },
      trace = {
        server = "verbose",
      },
      stubs = {
        "bcmath",
        "bz2",
        "calendar",
        "Core",
        "ctype",
        "curl",
        "date",
        "dom",
      },
      files = {
        associations = { "*.php", "*.phtml", "*.module", "*.inc" },
      },
    },
  },
}
