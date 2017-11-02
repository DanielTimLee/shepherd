local singletons = require "kong.singletons"
local inspect = require('inspect')

local config = {}
config.entry = nil

function config.fetch()
  local plugins_dao = singletons.dao.plugins

  local plugins, err = plugins_dao:find_all({ name = 'shepherd' })
  if err then
    ngx.log(ngx.ERR, "err in fetching plugins: ", err)
  end
  -- TODO: Error Handling

  if next(plugins) ~= nil then
    config.entry = plugins[1]['config']
    return config.entry
  else
    ngx.log(ngx.ERR, "NOT FOUND! Try Migration AGAIN!", err)
  end

end

return config

