---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
      'marilari88/neotest-vitest',
      'fredrikaverpil/neotest-golang',
    },
    keys = {
      { '<leader>tn', function() require('neotest').run.run() end, desc = '[T]est [N]earest' },
      { '<leader>tf', function() require('neotest').run.run(vim.fn.expand '%') end, desc = '[T]est [F]ile' },
      { '<leader>ts', function() require('neotest').summary.toggle() end, desc = '[T]est [S]ummary' },
      { '<leader>to', function() require('neotest').output_panel.toggle() end, desc = '[T]est [O]utput' },
      { '<leader>tl', function() require('neotest').run.run_last() end, desc = '[T]est run [L]ast' },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python',
          require 'neotest-vitest',
          require 'neotest-golang',
        },
      }
    end,
  },
}
