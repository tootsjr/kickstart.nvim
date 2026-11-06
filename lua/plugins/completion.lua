---@module 'lazy'
---@type LazySpec
return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = 'v1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
          },
        },
      },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        -- Using 'default' but overriding Enter (<CR>) to ensure snippets expand
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- This is the crucial link to make rafce work
      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'lua' },
      -- Keep completion suggestions available without opening large
      -- parameter/signature-help popups while typing function calls.
      signature = { enabled = false },
    },
  },
}
