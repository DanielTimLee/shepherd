local inspect = require('inspect')
local plugin = require("kong.plugins.base_plugin"):extend()

delay = 1209600 -- Migration delay (14 days)
req_header = nil;

local function migrationWorker()
  local ok, err = ngx.timer.at(delay, migrationHandler)
  if not ok then
    ngx.log(ngx.ERR, "failed to create the timer: ", err)
    migrationWorker() -- TODO: Must Fix! Coded this, Due to Unknown Error
    return
  end
end

-- Premature for Timer off
-- https://github.com/openresty/lua-nginx-module#ngxtimerat
function migrationHandler(premature)
  ngx.log(ngx.ERR, "Migration Work Start!")
  -- TODO: Migration Work HERE.
  if premature then
    return
  end
  migrationWorker()
end


function plugin:new()
  plugin.super.new(self, "Shepherd")
end


function plugin:init_worker()
  plugin.super.access(self)
  migrationWorker()
end


local function get_headers(header)
  req_header = header
end

local function echo_headers()
  for k, v in pairs(req_header) do
    ngx.header[k] = v
  end
end


function plugin:access(plugin_conf)
  plugin.super.access(self)
  ngx.log(ngx.ERR, inspect(plugin_conf))

  get_headers(ngx.req.get_headers())
  if req_header['version'] then
    ngx.redirect("http://auth.dbrainscience.io")
  end
end

function plugin:header_filter(plugin_conf)
  plugin.super.access(self)

  echo_headers()
end

function plugin:body_filter(plugin_conf)
  plugin.super.access(self)
  -- your custom code here
end

-- For Priority Upper than Req/Resp-Transformer
plugin.PRIORITY = 850

return plugin
