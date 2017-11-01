local singletons = require "kong.singletons"

local config = {}
config.entry = nil

function config.fetch()
  local plugins_dao = singletons.dao.plugins

  local plugins, err = plugins_dao:find_all({ name = 'Shepherd' })
  if err then
    ngx.log(ngx.ERR, "err in fetching plugins: ", err)
  end
  -- TODO: Error Handling

  config.entry = plugins[1]['config']
  return config.entry
end

return config

