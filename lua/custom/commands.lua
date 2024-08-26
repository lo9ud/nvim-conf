local cmd_base = {
  cmd = function(opts) end,
  init = function() end,
  nvim_opt = {},
}

local commands = {}

function init()
  print 'Custom commands beginning init'
  for name, cmd_opts in pairs(commands) do
    -- create cmd opts
    local cmd = {}
    -- pre-populate with defautls
    for k, v in pairs(cmd_base) do
      cmd[k] = v
    end
    -- insert correct options
    for k, v in pairs(cmd_opts) do
      cmd[k] = v
    end
    print('Initialising ' .. name)
    cmd.init()
    vim.api.nvim_create_user_command(name, cmd.cmd, cmd.nvim_opts)
    print('Done ' .. name)
  end
end
