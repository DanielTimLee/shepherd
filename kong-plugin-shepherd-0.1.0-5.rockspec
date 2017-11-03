package = "kong-plugin-shepherd"  -- as a convention; stick to the prefix: `kong-plugin-`
version = "0.1.0-5"

supported_platforms = {"linux", "macosx"}
source = {
  url = "git://github.com/Mashape/kong_plugin",
  tag = "0.1.0"
}

description = {
  summary = "Kong is a scalable and customizable API Management Layer built on top of Nginx.",
  homepage = "http://getkong.org",
  license = "MIT"
}

dependencies = {
}

local pluginName = "shepherd"
build = {
  type = "builtin",
  modules = {
    ["kong.plugins."..pluginName..".migrations.postgres"] = "kong/plugins/"..pluginName.."/migrations/postgres.lua",
    ["kong.plugins."..pluginName..".misc.migrate"] = "kong/plugins/"..pluginName.."/misc/migrate.lua",
    ["kong.plugins."..pluginName..".misc.config"] = "kong/plugins/"..pluginName.."/misc/config.lua",

    ["kong.plugins."..pluginName..".views.components"] = "kong/plugins/"..pluginName.."/views/components.lua",
    ["kong.plugins."..pluginName..".views.layout"] = "kong/plugins/"..pluginName.."/views/layout.lua",

    ["kong.plugins."..pluginName..".handler"] = "kong/plugins/"..pluginName.."/handler.lua",
    ["kong.plugins."..pluginName..".schema"] = "kong/plugins/"..pluginName.."/schema.lua",

    ["kong.plugins."..pluginName..".daos"] = "kong/plugins/"..pluginName.."/daos.lua",
    ["kong.plugins."..pluginName..".api"] = "kong/plugins/"..pluginName.."/api.lua",
  }
}
