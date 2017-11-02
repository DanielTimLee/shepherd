local shepherd = require("kong.plugins.base_plugin"):extend()
local basePath = (...):match("(.-)[^%.]+$") -- returns 'shepherd Base'
local config = require(basePath .. 'config')
local migrate = require(basePath .. 'migrate')

local inspect = require('inspect')

req_header = nil;

-- Only For Instantiate
function shepherd:new()
  shepherd.super.new(self, 'shepherd')
end


function shepherd:init_worker()
  shepherd.super.access(self)
  config:fetch()
  migrate:execute()
end


local function get_headers(header)
  req_header = header
end


function shepherd:access()
  shepherd.super.access(self)
  get_headers(ngx.req.get_headers())
  if req_header['version'] then
    ngx.redirect("http://auth.dbrainscience.io")
  end
end

function shepherd:header_filter(plugin_conf)
  shepherd.super.access(self)
end

-- For Priority Upper than Req/Resp-Transformer
shepherd.PRIORITY = 850
shepherd.VERSION = "0.1.0"

return shepherd
