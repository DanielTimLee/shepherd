local index = require("kong.plugins.shepherd.views.index")
local layout = require("kong.plugins.shepherd.views.layout")
local index_url = "/shepherd"

return {
  [index_url] = {
    GET = function(self, dao_factory)
      -- CRUD helper Returns all the way through by itself, so custom fetch from DAO.
      local rules, err = dao_factory.daos.shepherd:find_all()
      if err then
        ngx.log(ngx.ERR, "err in Fetching Rule: ", err)
      end

      self.rules = rules
      self.rules_len = table.getn(self.rules)

      return { render = index, layout = layout, content_type = "text/html" }
    end,
    POST = function(self, dao_factory) -- TODO: Validation Handle
      local target_rule = self.POST
      local new_rule = {
        client_version = target_rule['client_version'],
        module_version = target_rule['module_version'],
        endpoint = target_rule['endpoint'],
        module = target_rule['module']
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

      return { json = { message = 'Success with update' } }
    end,
    DELETE = function(self, dao_factory) -- TODO: Validation Handle
      local target_rule = self.json

      local res, err = dao_factory.shepherd:delete({ id = target_rule.id })
      if err then
        ngx.log(ngx.ERR, "err in Deleting Rule: ", err)
      end

      return { json = { message = 'Success with delete' } }
    end
  }
}