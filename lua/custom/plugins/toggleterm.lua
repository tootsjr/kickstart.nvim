---@module 'lazy'
---@type LazySpec
return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = { { '<C-\\>', mode = { 'n', 't' }, desc = 'Toggle terminal' } },
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
