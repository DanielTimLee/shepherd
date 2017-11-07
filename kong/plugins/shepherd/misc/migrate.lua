local pluginBase = "kong.plugins.shepherd"
local config = require(pluginBase .. ".misc.config")

local migrate = {}

local function setTimer()
  local ok, err = ngx.timer.at(config.entry["migration_delay"], migrate.proceed)
  if not ok then
    ngx.log(ngx.ERR, "failed to create the timer: ", err)
    -- TODO: Error Handling, If Fails? Must Fix! When Timer Create Fails?
    return
  end
end

-- Premature for Timer off
-- https://github.com/openresty/lua-nginx-module#ngxtimerat
function migrate.execute(premature)
  ngx.log(ngx.CRIT, "Migration Work Start!")
  -- TODO: Backup Work HERE.
  if premature then
    return
  end
  setTimer()
end

return migrate
