---@module 'lazy'
---@type LazySpec
return {
  {
    'coder/claudecode.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    ---@module 'claudecode'
    ---@type ClaudeCode.Config
    opts = {
      focus_after_send = true,
      track_selection = true,
      terminal = {
        split_side = 'right',
        split_width_percentage = 0.38,
        auto_close = true,
      },
      diff_opts = {
        layout = 'vertical',
        open_in_new_tab = false,
        keep_terminal_focus = false,
      },
    },
    keys = {
      { '<leader>ac', '<cmd>ClaudeCode<cr>',              desc = '[A]I [C]laude toggle' },
      { '<leader>af', '<cmd>ClaudeCodeFocus<cr>',         desc = '[A]I [F]ocus terminal' },
      { '<leader>ar', '<cmd>ClaudeCode --resume<cr>',     desc = '[A]I [R]esume session' },
      { '<leader>aC', '<cmd>ClaudeCode --continue<cr>',   desc = '[A]I [C]ontinue session' },
      { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>',   desc = '[A]I select [M]odel' },
      { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>',         desc = '[A]I add current [B]uffer' },
      { '<leader>as', '<cmd>ClaudeCodeSend<cr>',          mode = 'v', desc = '[A]I [S]end selection' },
      { '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>',       ft = { 'neo-tree', 'NvimTree', 'oil', 'minifiles', 'netrw' }, desc = '[A]I add file from tree' },
      { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>',    desc = '[A]I [A]ccept diff' },
      { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>',      desc = '[A]I [D]eny diff' },
    },
  },
}
