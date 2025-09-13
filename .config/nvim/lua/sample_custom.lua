local M = {}

M.plugins = {
  { "Shatur/neovim-ayu" }
}


M.configs = function()
  require("ayu").colorscheme()
end

M.formatting_servers = {
  rust_analyzer = {},
  lua_ls = {},
}

M.ensure_installed = { "toml" }

M.setup_sources = function(b)
  return {
    b.formatting.autopep8,
    b.formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" }
    },
    b.formatting.black.with {
      extra_args = { "--fast" }
    },
    b.formatting.stylua,
  }
end

return M
