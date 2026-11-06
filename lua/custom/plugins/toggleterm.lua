---@module 'lazy'
---@type LazySpec
return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
      { '<C-\\>', mode = { 'n', 't' }, desc = 'Toggle terminal' },
      {
        '<leader>rp',
        function()
          vim.cmd 'write'

          local python = vim.fn.executable 'python' == 1 and 'python' or 'python3'
          local file = vim.fn.shellescape(vim.fn.expand '%:p')
          require('toggleterm.terminal').Terminal:new {
            cmd = python .. ' ' .. file,
            direction = 'float',
            close_on_exit = false,
          }:toggle()
        end,
        ft = 'python',
        desc = '[R]un [P]ython file',
      },
    },
    opts = {
      open_mapping = [[<C-\>]],
      direction = 'float',
      float_opts = { border = 'curved' },
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
    },
  },
}
