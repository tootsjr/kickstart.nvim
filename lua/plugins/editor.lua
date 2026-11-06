---@module 'lazy'
---@type LazySpec
return {
  --  ADD FLASH (Navigation)
  {
    'folke/flash.nvim',
    cond = true, -- also load in VS Code
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash Jump' },
    },
  },

  --  ADD LAZYDEV (Lua Intelligence for your config)
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    ---@module 'which-key'
    ---@type wk.Opts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
        { '<leader>t', group = '[T]oggle / [T]est' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>a', group = '[A]I Assistant' },
        { '<leader>x', group = 'Diagnostics' },
        { '<leader>c', group = '[C]ode' },
        { '<leader>r', group = '[R]un' },
        { '<leader>R', group = '[R]eplace (Spectre)' },
        { 'gr', group = 'LSP Actions', mode = { 'n' } },
      },
    },
  },
}
