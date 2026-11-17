-- autopairs
-- https://github.com/windwp/nvim-autopairs

---@module 'lazy'
---@type LazySpec
return {
  'windwp/nvim-autopairs',
  event = { 'BufReadPost', 'BufNewFile', 'InsertEnter' },
  opts = {},
}
