---@module 'lazy'
---@type LazySpec
return {
  {
    -- No aamis port exists for nvim, so build it from the vscode theme's palette
    'nvim-mini/mini.base16',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      require('mini.base16').setup {
        palette = {
          base00 = '#0f0f0f', base01 = '#1a1a1a', base02 = '#373026', base03 = '#5e5959',
          base04 = '#706a6a', base05 = '#eadccc', base06 = '#e6caab', base07 = '#ede4c8',
          base08 = '#e25d6c', base09 = '#e9838f', base0A = '#f4bb54', base0B = '#cea37f',
          base0C = '#e8ab3b', base0D = '#e2be8a', base0E = '#f66151', base0F = '#edb95a',
        },
      }
      vim.g.colors_name = 'aamis'

      -- Keep all chrome elements fully transparent so wezterm bg shows through
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none', fg = '#5e5959' })
      vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
      -- NonText can keep a solid grey bg; IblIndent/IblWhitespace link to it,
      -- which paints every indent-guide column grey instead of transparent
      vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })
      -- Floats get a solid dark bg so noice/blink popups don't bleed through content
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1a1a1a' })
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1a1a1a', fg = '#5e5959' })
      -- Telescope keeps its own highlight groups instead of inheriting FloatBorder,
      -- so pickers rendered transparent with a mismatched border color
      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#1a1a1a' })
      vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#1a1a1a', fg = '#5e5959' })
      -- blink.cmp's menu links to Pmenu (lighter grey) while its doc panel links to
      -- NormalFloat, so the two looked mismatched side by side
      vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { bg = '#1a1a1a' })
      vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { bg = '#1a1a1a', fg = '#5e5959' })
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none' })
      -- barbecue's winbar falls back to WinBar's solid bg wherever its own
      -- highlight spans don't cover, same fix as StatusLine above
      vim.api.nvim_set_hl(0, 'WinBar', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'WinBarNC', { bg = 'none' })
      -- Give the active line a very subtle lift without making the transparent
      -- editor feel like it has a solid panel behind it.
      vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#161616' })
      vim.api.nvim_set_hl(0, 'NoiceCmdlinePopup', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { bg = 'none', fg = '#5e5959' })
      vim.api.nvim_set_hl(0, 'Comment', { fg = '#5e5959', italic = true })
      vim.api.nvim_set_hl(0, '@comment', { fg = '#5e5959', italic = true })
      vim.api.nvim_set_hl(0, '@comment.documentation', { fg = '#5e5959', italic = true })
      vim.opt.fillchars:append { vert = '▏', vertleft = '▏', vertright = '▏', verthoriz = '▏' }
      vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#1a1a1a' })
      vim.api.nvim_set_hl(0, 'Cursor', { bg = '#eadccc', fg = '#0f0f0f' })
      vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none', fg = '#e2be8a', bold = true })
      vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#373026', fg = '#eadccc', bold = true })
      vim.api.nvim_set_hl(0, 'Visual', { bg = '#373026' })

      local function italicize(group)
        local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
        hl.italic = true
        vim.api.nvim_set_hl(0, group, hl)
      end
      local italic_groups = {
        '@keyword',
        '@keyword.conditional',
        '@keyword.repeat',
        '@keyword.return',
        '@keyword.function',
        '@keyword.operator',
        '@keyword.import',
        '@type',
        '@type.builtin',
        '@variable.parameter',
        '@variable.builtin',
        '@constant.builtin',
      }
      for _, group in ipairs(italic_groups) do
        italicize(group)
      end
    end,
  },
}
