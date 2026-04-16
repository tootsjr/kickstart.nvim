---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>R', '<cmd>lua require("spectre").toggle()<CR>', desc = '[R]eplace in project (Spectre)' },
      { '<leader>Rw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', mode = { 'n', 'v' }, desc = '[R]eplace current [w]ord' },
      { '<leader>Rf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = '[R]eplace in current [f]ile' },
    },
    opts = { open_cmd = 'noswapfile vnew' },
  },
}
