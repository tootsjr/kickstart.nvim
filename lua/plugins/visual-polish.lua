---@module 'lazy'
---@type LazySpec
return {
  -- Highlights the indentation scope around the cursor instead of adding more
  -- permanent visual noise to every buffer.
  {
    'echasnovski/mini.indentscope',
    version = false,
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      draw = {
        delay = 80,
        animation = function(_, step)
          return 20 * step
        end,
      },
      symbol = '│',
      options = {
        try_as_border = true,
      },
    },
  },

  -- Keeps the current function or class visible while scrolling large files.
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      max_lines = 3,
      multiline_threshold = 1,
      trim_scope = 'outer',
      mode = 'cursor',
      separator = '▔',
      zindex = 20,
    },
  },

  -- Gives Markdown headings, checkboxes, tables, and code blocks a readable
  -- rendered appearance while preserving normal editing.
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'quarto' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      enabled = true,
      render_modes = { 'n', 'c', 't' },
      heading = {
        enabled = true,
        sign = false,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        backgrounds = {
          'RenderMarkdownH1Bg',
          'RenderMarkdownH2Bg',
          'RenderMarkdownH3Bg',
          'RenderMarkdownH4Bg',
          'RenderMarkdownH5Bg',
          'RenderMarkdownH6Bg',
        },
      },
      code = {
        enabled = true,
        sign = false,
        style = 'full',
        border = 'thin',
        width = 'block',
        left_pad = 1,
        right_pad = 1,
      },
      bullet = {
        icons = { '◆', '◇', '○', '●' },
      },
      checkbox = {
        enabled = true,
        position = 'inline',
        unchecked = { icon = '󰄱 ' },
        checked = { icon = '󰱒 ' },
      },
    },
  },

  -- Use Snacks' polished animation primitives without duplicating existing
  -- Telescope, Alpha, Noice, Lualine, or ToggleTerm functionality.
  {
    'folke/snacks.nvim',
    priority = 900,
    lazy = false,
    opts = {
      animate = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      picker = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      terminal = { enabled = false },
      words = { enabled = false },
    },
  },
}
