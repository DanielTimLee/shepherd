-- daos.lua (Models for Other Frameworks
local SCHEMA = {
  primary_key = { "id" },
  table = "shepherd", -- the actual table in the database
  fields = {
    id = { type = "id", dao_insert_value = true }, -- a value to be inserted by the DAO itself (think of serial ID and the uniqueness of such required here)
    client_version = { type = "string", required = false },
    endpoint = { type = "string", required = true },
    module = { type = "string", required = true },
    module_version = { type = "string", required = true },
    is_active = { type = "boolean", default = true, required = true },
    created_date = { type = "timestamp", immutable = true, required = true, dao_insert_value = true },
    updated_date = { type = "timestamp", required = true, dao_insert_value = true },
  }
}

return { shepherd = SCHEMA } -- this plugin only results in one custom DAO, named `keyauth_credentials`
