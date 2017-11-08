local shepherd = require("kong.plugins.base_plugin"):extend()

local pluginBase = "kong.plugins.shepherd"
local config = require(pluginBase .. ".misc.config")
local migrate = require(pluginBase .. ".misc.migrate")

local cJson = require("cjson")

-- Only For Instantiate
function shepherd:new()
  shepherd.super.new(self, "shepherd")
end


function shepherd:init_worker()
  shepherd.super.access(self)
  config:fetch()
  migrate:execute()
end


-- JSON Return with ngx_lua_api : http://blog.zot24.com/return-json-responses-when-using-openresty-lua/
local function navigate_error(message)
  ngx.status = ngx.HTTP_OK
  ngx.header.content_type = "application/json; charset=utf-8"
  ngx.say(cJson.encode { message = message })
end


local function navigate()
  -- do not call dao before Init worker. Context can"t search dao.
  local dao = require("kong.singletons").dao.shepherd
  local req_header = ngx.req.get_headers()

  if req_header["client_version"] then
    local query = { client_version = req_header["client_version"], endpoint = ngx.var.uri } -- without param

    local rules, err = dao:find_all(query)
    if err then
      ngx.log(ngx.ERR, "err in Fetching Rule: ", err)
    end

    if table.getn(rules) ~= 0 then
      local redirect_url = rules[1]["module"] .. "/" .. rules[1]["module_version"] .. ngx.var.request_uri -- with param
      ngx.log(ngx.ERR, redirect_url) -- log
      ngx.redirect(redirect_url)
    else
      navigate_error("No match rules found. Please Check your Rule registered status.")
    end
    --else  navigate_error() -- Uncomment If want to block all the direct API request
  end
end


-- [IMPORTANT] : Rewrite Phase phase neither the `api` nor the `consumer` will have been identified.
-- So Global Plugins can fetch requests without checking whether request exists in API table.
-- Access phase can"t fetch requests if requests are not registered in API table.
function shepherd:rewrite()
  shepherd.super.rewrite(self)
  navigate()
end


-- For Priority Upper than Req/Resp-Transformer
shepherd.PRIORITY = 8500
shepherd.VERSION = "0.1.0"

return shepherd
