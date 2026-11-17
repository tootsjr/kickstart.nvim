local M = {}

local managed_bin

local function find_environment(path)
  for _, name in ipairs { '.venv', 'venv', '.ven' } do
    local directory = vim.fs.find(name, {
      path = path,
      upward = true,
      type = 'directory',
      limit = 1,
    })[1]

    if directory then
      local python = directory .. '/bin/python'
      if vim.fn.executable(python) == 1 then return directory, python end
    end
  end
end

function M.python_for(path)
  local _, python = find_environment(path)
  return python
end

function M.environment_for(path)
  return find_environment(path)
end

function M.activate(path)
  local environment, python = find_environment(path)
  if not environment then return end

  local bin = environment .. '/bin'
  if managed_bin ~= bin then
    local path_entries = {}
    for entry in vim.env.PATH:gmatch '[^:]+' do
      if entry ~= managed_bin and entry ~= bin then table.insert(path_entries, entry) end
    end
    vim.env.PATH = bin .. ':' .. table.concat(path_entries, ':')
    managed_bin = bin
  end
  vim.env.VIRTUAL_ENV = environment

  return python
end

function M.setup()
  local group = vim.api.nvim_create_augroup('project-python-environment', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufEnter', 'DirChanged' }, {
    group = group,
    callback = function(args)
      local path = vim.api.nvim_buf_get_name(args.buf)
      if path ~= '' then M.activate(vim.fs.dirname(path)) end
    end,
  })
end

return M
