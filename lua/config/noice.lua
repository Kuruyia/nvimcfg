-- Noice
require('noice').setup({
  cmdline = {
    format = {
      cmdline = { icon = ':' },
      search_down = { icon = '/' },
    },
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  presets = {
    long_message_to_split = true,
    lsp_doc_border = false,
  },
})
