return {
  no_consumer = false, -- this plugin is available on APIs as well as on Consumers,
  fields = {
    -- Describe your plugin's configuration's schema here.
    migration_url = { type = "string", required = true }, -- S3 or Any Storage URL
    migration_delay = { type = "number", immutable = true, required = true, default = 1209600 }, -- delay (14 days)
    use_client_ver = { type = "boolean", default = true },
  },
  self_check = function(schema, plugin_t, dao, is_updating)
    -- perform any custom verification
    return true
  end
}
--local http = require("socket.http")
--http.request(url [, body])

-- TODO: Immutable not working?
