-- Noice
local excluded_lsp_client_progress_notification = { 'ltex_plus' }

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
    lsp_doc_border = true,
  },
  routes = {
    {
      filter = {
        event = 'lsp',
        kind = 'progress',
        cond = function(message)
          local client = vim.tbl_get(message.opts, 'progress', 'client')

          for _, v in pairs(excluded_lsp_client_progress_notification) do
            if client == v then
              return true
            end
          end

          return false
        end,
      },
      opts = { skip = true },
    },
  },
})
