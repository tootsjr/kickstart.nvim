---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>R',  function() require('spectre').toggle() end,                              desc = '[R]eplace in project (Spectre)' },
      { '<leader>Rw', function() require('spectre').open_visual { select_word = true } end,    mode = { 'n', 'v' }, desc = '[R]eplace current [w]ord' },
      { '<leader>Rf', function() require('spectre').open_file_search { select_word = true } end, desc = '[R]eplace in current [f]ile' },
    },
    opts = { open_cmd = 'noswapfile vnew' },
  },
}
