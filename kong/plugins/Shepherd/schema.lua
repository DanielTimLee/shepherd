return {
  no_consumer = false, -- this plugin is available on APIs as well as on Consumers,
  fields = {-- Describe your plugin's configuration's schema here.
    migration_url = { type = "string", required = true }, -- S3 or Any Storage URL
    migration_delay = { type = "number", immutable = true, required = true, default = 1209600 }, -- second
    use_api_stage = { type = "boolean", default = true }, -- TEST, DEV, LIVE
    use_client_ver = { type = "boolean", default = true },
    global_stage = { type = "array", default = "LIVE", enum = { "TEST", "DEV", "LIVE" } }
  },
  self_check = function(schema, plugin_t, dao, is_updating)
    -- perform any custom verification
    return true
  end
}


-- TODO: Immutable not working
