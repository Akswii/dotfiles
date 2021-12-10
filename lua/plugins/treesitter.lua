require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
