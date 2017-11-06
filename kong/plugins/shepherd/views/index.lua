local Widget
Widget = require("lapis.html").Widget
local Index
do
  local _class_0
  local _parent_0 = Widget
  local _base_0 = {
    content = function(self)
      return div({
        class = "section no-pad-bot"
      }, function()
        return div({
          class = "container"
        }, function()
          return element("table", {
            class = "striped centered highlight"
          }, function()
            thead(function()
              return tr(function()
                th("Client Version")
                th("API Endpoint")
                th("API Module")
                th("API Version")
                return th("Action")
              end)
            end)
            return tbody(function()
              return tr(function()
                td("v1.0.1")
                td("/kaiser/keyword")
                td("KE")
                td("v1")
                return td(function()
                  a({
                    class = "waves-effect waves-light blue btn-floating"
                  }, function()
                    return i({
                      class = "material-icons"
                    }, "edit")
                  end)
                  local _ = br
                  return a({
                    class = "waves-effect waves-light red btn-floating"
                  }, function()
                    return i({
                      class = "material-icons"
                    }, "remove_circle")
                  end)
                end)
              end)
            end)
          end)
        end)
      end)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Index",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Index = _class_0
  return _class_0
end
