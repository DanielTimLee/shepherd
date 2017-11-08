local config = require("kong.plugins.shepherd.misc.config")

local index = require("kong.plugins.shepherd.views.index")
local layout = require("kong.plugins.shepherd.views.layout")
local index_url = "/shepherd"

return {
  [index_url] = {
    GET = function(self, dao_factory)
      -- CRUD helper Returns all the way through by itself, so custom fetch from DAO.
      if config.status() == false then
        self.message = "Plugin Status Unknown. Please Check Plugin Status."
      else
        -- Fetch Existing APIs
        local apis, err = dao_factory.daos.apis:find_all()
        if err then
          ngx.log(ngx.ERR, "err in Fetching Apis: ", err)
        end

        self.apis = apis
        self.apis_len = table.getn(self.apis)

        if self.apis_len == 0 then
          self.message = "No APIs Found. Before start, Create APIs."
        end

        -- Fetch Existing Shepherd Rules
        local rules, err = dao_factory.daos.shepherd:find_all()
        if err then
          ngx.log(ngx.ERR, "err in Fetching Rule: ", err)
        end

        self.rules = rules
        self.rules_len = table.getn(self.rules)
      end

      return { render = index, layout = layout, content_type = "text/html" }
    end,
    POST = function(self, dao_factory) -- TODO: Validation Handle
      -- TODO: [CRT] Block Same Client_ver, module entity
      local target_rule = self.POST
      local new_rule = {
        client_version = target_rule["client_version"],
        module_version = target_rule["module_version"],
        endpoint = target_rule["endpoint"],
        module = target_rule["module"]
      }

      local res, err = dao_factory.shepherd:insert(new_rule)
      if err then
        ngx.log(ngx.ERR, "err in Inserting Rule: ", err)
      end

      return { redirect_to = self:url_for(index_url) }
    end,
    PUT = function(self, dao_factory) -- TODO: Validation Handle
      local target_rule = self.json

      local res, err = dao_factory.shepherd:update(target_rule, { id = target_rule.id })
      if err then
        ngx.log(ngx.ERR, "err in Updating Rule: ", err)
      end

      return { json = { message = "Success with update" } }
    end,
    DELETE = function(self, dao_factory) -- TODO: Validation Handle
      local target_rule = self.json

      local res, err = dao_factory.shepherd:delete({ id = target_rule.id })
      if err then
        ngx.log(ngx.ERR, "err in Deleting Rule: ", err)
      end

      return { json = { message = "Success with delete" } }
    end
  }
}
