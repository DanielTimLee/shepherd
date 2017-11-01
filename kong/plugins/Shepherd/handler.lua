local plugin = require("kong.plugins.base_plugin"):extend()
local basePath = (...):match("(.-)[^%.]+$") -- returns 'Shepherd Base'
local config = require(basePath .. 'config')
local migrate = require(basePath .. 'migrate')

local inspect = require('inspect')

req_header = nil;

-- Only For Instantiate
function plugin:new()
  plugin.super.new(self, 'Shepherd')
end


function plugin:init_worker()
  plugin.super.access(self)
  config:fetch()
  migrate:proceed()
end


local function get_headers(header)
  req_header = header
end


function plugin:access()
  plugin.super.access(self)
  get_headers(ngx.req.get_headers())
  if req_header['version'] then
    ngx.redirect("http://auth.dbrainscience.io")
  end
end

function plugin:header_filter(plugin_conf)
  plugin.super.access(self)
end

-- For Priority Upper than Req/Resp-Transformer
plugin.PRIORITY = 850

return plugin
