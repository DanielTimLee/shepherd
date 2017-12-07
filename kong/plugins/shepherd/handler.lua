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

--[[ Following Plugin's Use-case will be like below.
+----------+------------+---------+
| redirect | client_ver | results |
+----------+------------+---------+
|          |      O     | Convert |
+   None   +------------+---------+
|          |      X     |  Bypass |
+----------+------------+---------+
|          |      O     | Convert |
+     1    +------------+---------+
|          |      X     |  Bypass |
+----------+------------+---------+
|          |      O     |  Bypass |
+   NOT 1  +------------+---------+
|          |      X     |  Bypass |
+----------+------------+---------+
]] --

-- JSON Return with ngx_lua_api : http://blog.zot24.com/return-json-responses-when-using-openresty-lua/
local function navigate_error(message)
  ngx.status = ngx.HTTP_NOT_FOUND
  ngx.header.content_type = "application/json; charset=utf-8"
  ngx.say(cJson.encode { message = message })
end

-- https://serverfault.com/q/855720
local CLIENT_VERSION = 'client-version';
local REDIRECT_TRUE = '1';

local function navigate()
  -- do not call dao before Init worker. Context can"t search dao.
  local dao = require("kong.singletons").dao.shepherd
  local req_header = ngx.req.get_headers()
  local base_args = ngx.req.get_uri_args()

  if base_args.redirect == nil then
    if req_header[CLIENT_VERSION] ~= nil then
      local query = { client_version = req_header[CLIENT_VERSION], endpoint = ngx.var.uri }

      local rules, err = dao:find_all(query)
      if err then
        ngx.log(ngx.ERR, "err in Fetching Rule: ", err)
      end

      if table.getn(rules) ~= 0 then
        base_args.redirect = REDIRECT_TRUE;
        ngx.req.set_uri_args(base_args)

        local base_url = ngx.var.uri .. ngx.var.is_args .. ngx.var.query_string
        local redirect_url = rules[1]["module"] .. "/" .. rules[1]["module_version"] .. base_url

        ngx.log(ngx.ERR, redirect_url) -- log
        ngx.redirect(redirect_url, ngx.HTTP_TEMPORARY_REDIRECT) -- must be 307 to use same method.
      else
        navigate_error("No match rules found. Please Check your Rule registered status.")
      end

      --else  navigate_error() -- Uncomment If want to block all the direct API request
    end
  elseif base_args.redirect == REDIRECT_TRUE then
    base_args.redirect = nil
    ngx.req.set_uri_args(base_args)
  end
  -- redirect with any other argument than '1' will bypass plugin.
end


-- [IMPORTANT] : Rewrite Phase phase neither the `api` nor the `consumer` will have been identified.
-- So Global Plugins can fetch requests without checking whether request exists in API table.
-- Access phase can"t fetch requests if requests are not registered in API table.
function shepherd:rewrite()
  shepherd.super.rewrite(self)
  navigate()
end


-- For Priority Upper than Req/Resp-Transformer
shepherd.PRIORITY = 850
shepherd.VERSION = "0.5.0"

return shepherd
