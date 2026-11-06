return {
  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = { 'Function', 'Label' },
      },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'lazy',
          'mason',
          'terminal',
          'toggleterm',
          'claudecode',
        },
      },
    },
  },

  -- Color highlighter
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      filetypes = {
        'css',
        'scss',
        'sass',
        'less',
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'lua',
        'json',
      },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = 'background',
        tailwind = true,
      },
    },
  },

  -- TODO comments
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      signs = true,
      keywords = {
        FIX  = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', color = 'default', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
      },
      colors = {
        error   = { '#e25d6c' },
        warning = { '#f4bb54' },
        info    = { '#e2be8a' },
        hint    = { '#cea37f' },
        default = { '#e9838f' },
      },
    },
  },

  -- Dashboard
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Yggdrasil, the Norse World Tree
      local yggdrasil = {
        ' ⠀⠀⠀⠀⠀⠀⢀⢀⠀⣄⢂⣀⣂⣤⣀⢀⢀⠀⠀⠀⠀⠀⠀ ',
        ' ⠀⠀⠀⠀⣄⣰⣝⣉⣙⢱⣞⠜⡖⣌⣌⣁⣻⣠⣀⠀⠀⠀⠀ ',
        ' ⠀⠀⢔⢽⣊⣂⣇⡒⠮⢻⣇⠲⢍⣿⢟⣒⣰⣠⣑⡔⣀⠀⠀ ',
        ' ⠀⠹⡸⢙⣕⡐⢂⠍⣩⡻⣿⣆⣾⠟⣉⢣⠪⠲⡰⡋⣢⢆⠀ ',
        ' ⠀⣪⡹⣵⢦⠽⡓⠶⠶⣧⣹⣿⣏⣴⠶⠛⠟⠽⢛⣒⢮⡙⠀ ',
        ' ⠸⢋⢪⠑⢩⠈⠀⠀⠀⠈⣿⣿⣿⠁⠀⠀⠘⢠⠈⠆⢎⢱⠁ ',
        ' ⠀⠻⡕⡲⡈⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠆⠄⠁ ',
        ' ⠀⠀⠀⠇⠀⠀⠀⠀⠀⣰⣿⣿⣿⣤⡀⠀⠀⠀⠀⠌⠘⠀⠀ ',
        ' ⠀⠀⠀⢱⠒⡶⡶⢖⣫⡿⢻⠿⡟⢿⣍⡱⢖⠶⠒⡆⠀⠀⠀ ',
        ' ⠀⠀⠀⠀⠁⠬⡃⠴⣇⣴⠏⠖⠙⣦⣸⠦⡼⠣⠉⠀⠀⠀⠀ ',
        ' ⠀⠀⠀⠀⠀⠀⠈⠁⠑⠢⠧⠭⠼⠵⠋⠊⠁⠀⠀⠀⠀⠀⠀ ',
      }

      -- Sample the vivid-to-faded gradient from the active colorscheme (Keyword -> Comment, both
      -- light enough to stay visible against the bg) instead of hardcoding hex values, so it
      -- stays correct across theme changes
      local function hl_hex(name, fallback)
        local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
        return hl.fg and string.format('#%06x', hl.fg) or fallback
      end

      local function create_gradient(start, finish, steps)
        local r1, g1, b1 = tonumber('0x' .. start:sub(2, 3)), tonumber('0x' .. start:sub(4, 5)), tonumber('0x' .. start:sub(6, 7))
        local r2, g2, b2 = tonumber('0x' .. finish:sub(2, 3)), tonumber('0x' .. finish:sub(4, 5)), tonumber('0x' .. finish:sub(6, 7))

        local gradient = {}
        for i = 1, steps do
          local r = math.floor(r1 + (r2 - r1) / steps * i)
          local g = math.floor(g1 + (g2 - g1) / steps * i)
          local b = math.floor(b1 + (b2 - b1) / steps * i)
          table.insert(gradient, string.format('#%02x%02x%02x', r, g, b))
        end
        return gradient
      end

      local function apply_gradient_hl(text)
        local vivid = hl_hex('Keyword', '#f66151')
        local faded = hl_hex('Comment', '#5e5959')
        local gradient = create_gradient(vivid, faded, #text)

        local lines = {}
        for i, line in ipairs(text) do
          vim.api.nvim_set_hl(0, 'HeaderGradient' .. i, { fg = gradient[i] })
          table.insert(lines, {
            type = 'text',
            val = line,
            opts = { hl = 'HeaderGradient' .. i, shrink_margin = false, position = 'center' },
          })
        end

        return { type = 'group', val = lines, opts = { position = 'center' } }
      end

      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file',    ':Telescope find_files <CR>'),
        dashboard.button('n', '  New file',     ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('g', '  Find text',    ':Telescope live_grep <CR>'),
        dashboard.button('c', '  Config',       ':e $MYVIMRC <CR>'),
        dashboard.button('q', '  Quit',         ':qa<CR>'),
      }
      dashboard.section.buttons.opts.hl = 'Keyword'
      dashboard.section.buttons.opts.spacing = 0

      -- v_center sizes the gap above this block from the actual window height,
      -- so the tree+menu sit together as one centered unit instead of pinned to the top
      dashboard.config.layout = {
        {
          type = 'group',
          val = {
            apply_gradient_hl(yggdrasil),
            { type = 'padding', val = 2 },
            dashboard.section.buttons,
          },
          opts = { position = 'v_center' },
        },
      }

      alpha.setup(dashboard.opts)
    end,
  },

  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = 'quadratic',
        performance_mode = false,
      }
    end,
  },

  -- Floating cmdline, search, and notifications
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
      lsp = {
        signature = { enabled = false },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
      views = {
        cmdline_popup = {
          win_options = { cursorline = false, winblend = 0 },
        },
      },
    },
  },

  -- Richer statusline with git branch and diagnostics
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = function()
      -- Mode colors use the aamis palette (matches vscode theme)
      local c = {
        dark   = '#0f0f0f',
        fg     = '#eadccc',
        tan    = '#e2be8a',
        sand   = '#cea37f',
        yellow = '#f4bb54',
        red    = '#e25d6c',
        amber  = '#e8ab3b',
        gray   = '#706a6a',
      }
      require('lualine').setup {
        options = {
          theme = {
            normal   = { a = { fg = c.dark, bg = c.tan,    gui = 'bold' }, b = { fg = c.fg,   bg = 'NONE' }, c = { fg = c.gray, bg = 'NONE' } },
            insert   = { a = { fg = c.dark, bg = c.sand,   gui = 'bold' }, b = { fg = c.fg,   bg = 'NONE' }, c = { fg = c.gray, bg = 'NONE' } },
            visual   = { a = { fg = c.dark, bg = c.yellow, gui = 'bold' }, b = { fg = c.fg,   bg = 'NONE' }, c = { fg = c.gray, bg = 'NONE' } },
            replace  = { a = { fg = c.dark, bg = c.red,    gui = 'bold' }, b = { fg = c.fg,   bg = 'NONE' }, c = { fg = c.gray, bg = 'NONE' } },
            command  = { a = { fg = c.dark, bg = c.amber,  gui = 'bold' }, b = { fg = c.fg,   bg = 'NONE' }, c = { fg = c.gray, bg = 'NONE' } },
            inactive = { a = { fg = c.gray, bg = 'NONE' }, b = { fg = c.gray, bg = 'NONE' }, c = { fg = c.gray, bg = 'NONE' } },
          },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },

  -- Breadcrumbs: file path + code context (function/class) in the winbar.
  -- Theme is "auto" by default, so it inherits Normal's transparent bg.
  {
    'utilyre/barbecue.nvim',
    event = 'VeryLazy',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      exclude_filetypes = {
        'netrw',
        'toggleterm',
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'lazy',
        'mason',
        'claudecode',
      },
    },
  },
}
