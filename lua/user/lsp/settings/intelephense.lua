local home = os.getenv "HOME"

return {
  default_config = {
    cmd = { home .. ".local/share/nvim/mason/packages/intelephense/node_modules/intelephense", "--stdio" },
    filetypes = { "php" },
    root_pattern = {'composer.json', '.git'},
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
          "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
          "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext",
          "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli",
          "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
          "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap",
          "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy",
          "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
          "wordpress", "phpunit",
      },
      diagnostics = {
          enable = true,
      },      
      files = {
        associations = { "*.php", "*.phtml", "*.module", "*.inc" },
      },
    },
  },
}
