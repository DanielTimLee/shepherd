local html = require("lapis.html")
local cdnICON = 'https://fonts.googleapis.com/icon?family=Material+Icons'
local cdnCSS = 'https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css'
local cdnJS = 'https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js'
local Layout
do
  local _class_0
  local _parent_0 = html.Widget
  local _base_0 = {
    content = function(self)
      return html_5(function()
        head(function()
          link({
            rel = "stylesheet",
            href = cdnICON
          })
          link({
            rel = "stylesheet",
            href = cdnCSS
          })
          title("Shepherd Dashboard")
          return script({
            src = cdnJS
          })
        end)
        return body(function()
          nav({
            role = "navigation"
          }, function()
            return div({
              class = "nav-wrapper container"
            }, function()
              return a({
                class = "brand-logo",
                href = "#"
              }, function()
                return text("Shepherd Dashboard")
              end)
            end)
          end)
          div({
            class = "section no-pad-bot"
          }, function()
            return div({
              class = "container"
            }, function()
              element("p")
              h1({
                class = "header center light-blue-text text-lighten-1"
              }, "Shepherd")
              div({
                class = "row center"
              }, function()
                return h5({
                  class = "header col s12 light"
                }, "Client Versioning to Redirect API Endpoint, Modules")
              end)
              div({
                class = "row center"
              }, function()
                return a({
                  class = "btn-large waves-effect waves-light light-blue lighten-1",
                  href = "#"
                }, "Add New API")
              end)
              return p
            end)
          end)
          return self:content_for("inner")
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
    __name = "Layout",
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
  Layout = _class_0
  return _class_0
end
