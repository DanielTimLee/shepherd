local singletons = require "kong.singletons"


local config = {}
config.entry = nil

local query = function()
  local plugins_dao = singletons.dao.plugins

  local plugins, err = plugins_dao:find_all({ name = "shepherd" })
  if err then -- TODO: Error Handling
    ngx.log(ngx.ERR, "err in fetching plugins: ", err)
  else
    return plugins
  end
end


function config.status()
  local plugins = query()

  if next(plugins) ~= nil then
    return plugins[1]["enabled"]
  else
    return false
  end
end


function config.fetch()
  local plugins = query()

  if next(plugins) ~= nil then
    config.entry = plugins[1]["config"]
    return config.entry
  else
    ngx.log(ngx.ERR, "NOT FOUND! Enable Plugin First or Try Migration again!")
  end
end

return config

