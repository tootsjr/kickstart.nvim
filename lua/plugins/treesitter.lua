---@module 'lazy'
---@type LazySpec
return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'master',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'query',
          'vim',
          'vimdoc',
          'cpp',
          'rust',
          'python',
          'css',
          'typescript',
          'javascript',
          'tsx',
          'go',
          'json',
          'regex',
          'swift',
        },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true, disable = { 'c', 'cpp' } },
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'c', 'cpp' },
        callback = function()
          vim.bo.cindent = true
          vim.bo.smartindent = false
        end,
      })
    end,
  },
}
