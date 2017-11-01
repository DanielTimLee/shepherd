local basePath = (...):match("(.-)[^%.]+$") -- returns 'Shepherd Base'
local config = require(basePath .. 'config')

local migrate = {}

local function setTimer()
  local ok, err = ngx.timer.at(config.entry['migration_delay'], migrate.proceed)
  if not ok then
    ngx.log(ngx.ERR, "failed to create the timer: ", err) -- TODO : If Fails? Must Fix! When Timer Create Fails?
    -- TODO: Error Handling
    return
  end
end

-- Premature for Timer off
-- https://github.com/openresty/lua-nginx-module#ngxtimerat
function migrate.proceed(premature)
  ngx.log(ngx.DEBUG, "Migration Work Start!")
  -- TODO: Backup Work HERE.
  if premature then
    return
  end
  setTimer()
end

return migrate
