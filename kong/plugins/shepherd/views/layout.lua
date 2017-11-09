local html = require("lapis.html")
local cdnICON = "https://fonts.googleapis.com/icon?family=Material+Icons"
local cdnCSS = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"
local cdnJS = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"
local jqJS = "https://code.jquery.com/jquery-3.2.1.min.js"
local Layout
do
  local _class_0
  local _parent_0 = html.Widget
  local _base_0 = {
    content = function(self)
      return html_5(function()
        head(function()
          script({
            src = jqJS
          })
          script({
            src = cdnJS
          })
          title("🐑 Shepherd Dashboard")
          link({
            rel = "stylesheet",
            href = cdnCSS
          })
          link({
            rel = "stylesheet",
            href = cdnICON
          })
          return raw([[ <style> body{display:flex;min-height:100vh;flex-direction:column}main{flex:1 0 auto} </style> ]])
        end)
        return body(function()
          header(function()
            return nav({
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
          end)
          main(function()
            div({
              class = "section no-pad-bot"
            }, function()
              return div({
                class = "container"
              }, function()
                h1({
                  class = "header center light-blue-text text-lighten-1"
                }, "🐑 Shepherd")
                div({
                  class = "row center"
                }, function()
                  return h5({
                    class = "header col s12 light"
                  }, "Client Versioning Redirect with API Endpoint, Modules")
                end)
                if self.message then
                  return div({
                    class = "row center"
                  }, function()
                    return div({
                      class = "container"
                    }, function()
                      return div({
                        class = "blue lighten-5 card-panel pulse"
                      }, function()
                        return div({
                          class = "card-content"
                        }, function()
                          return h5(self.message)
                        end)
                      end)
                    end)
                  end)
                end
              end)
            end)
            self:content_for("inner")
            div({
              class = "section"
            })
            return div({
              class = "section"
            })
          end)
          return footer({
            class = "page-footer"
          }, function()
            div({
              class = "container"
            }, function()
              return div({
                class = "row"
              }, function()
                div({
                  class = "col l6 s12"
                }, function()
                  h5({
                    class = "white-text"
                  }, "Shepherd Plugin")
                  return p({
                    class = "gray-text text-lighten-4"
                  }, "Plugin for Client Versioning and Redirect with API Endpoint, Modules")
                end)
                return div({
                  class = "col l4 offset-l2 s12"
                }, function()
                  h5({
                    class = "white-text"
                  }, "Links")
                  return ul(function()
                    return li(function()
                      return a({
                        class = "grey-text text-lighten-3",
                        href = "http://dbrain.science"
                      }, "dBrainScience Homepage")
                    end)
                  end)
                end)
              end)
            end)
            return div({
              class = "footer-copyright"
            }, function()
              return div({
                class = "container"
              }, function()
                return text("© 2017 Copyright dBrainScience")
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
