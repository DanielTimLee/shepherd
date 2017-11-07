local Widget
Widget = require("lapis.html").Widget
local inp_css = 'validate no-mar-bot'
local Index
do
  local _class_0
  local _parent_0 = Widget
  local _base_0 = {
    content = function(self)
      return div({
        class = "section no-pad-top"
      }, function()
        return div({
          class = "container"
        }, function()
          raw([[ <style>
        .no-mar{margin:0px !important}.no-mar-top{margin-top:0px !important}.no-mar-bot{margin-bottom:0px !important}
        .full-size-hor{width:100%}
        #act-btn-box{position:relative;height:5rem}#act-btn{position:absolute;display:inline-block;right:2rem}
        #new-rule{display:none}.modify-rule{display:none}
        </style> ]])
          div({
            id = "act-btn-box"
          }, function()
            return div({
              class = "fixed-action-btn horizontal click-to-toggle",
              id = "act-btn"
            }, function()
              a({
                class = "btn-floating btn-large pulse red"
              }, function()
                return i({
                  class = "large material-icons"
                }, "menu")
              end)
              return ul(function()
                li(function()
                  return a({
                    class = "btn-floating blue",
                    id = "add-rule"
                  }, function()
                    return i({
                      class = "material-icons"
                    }, "add")
                  end)
                end)
                li(function()
                  return a({
                    class = "btn-floating green"
                  }, function()
                    return i({
                      class = "material-icons"
                    }, "edit")
                  end)
                end)
                return li(function()
                  return a({
                    class = "btn-floating yellow darken-1"
                  }, function()
                    return i({
                      class = "material-icons"
                    }, "search")
                  end)
                end)
              end)
            end)
          end)
          div({
            class = "row no-mar",
            id = "new-rule"
          }, function()
            return form({
              class = "col s12",
              method = "POST"
            }, function()
              return div({
                class = "row"
              }, function()
                div({
                  class = "input-field col s3"
                }, function()
                  input({
                    class = inp_css,
                    required = true,
                    ["data-length"] = "10",
                    name = "client_version",
                    type = "text",
                    placeholder = "v1.0.1"
                  })
                  return label({
                    ["for"] = "client_version"
                  }, "Client Version")
                end)
                div({
                  class = "input-field col s3"
                }, function()
                  input({
                    class = inp_css,
                    required = true,
                    name = "endpoint",
                    type = "text",
                    placeholder = "/my-api/end"
                  })
                  return label({
                    ["for"] = "endpoint"
                  }, "API Endpoint")
                end)
                div({
                  class = "input-field col s2"
                }, function()
                  input({
                    class = inp_css,
                    required = true,
                    name = "module",
                    type = "text",
                    placeholder = "KE"
                  })
                  return label({
                    ["for"] = "module"
                  }, "API Module")
                end)
                div({
                  class = "input-field col s2"
                }, function()
                  input({
                    class = inp_css,
                    required = true,
                    ["data-length"] = "10",
                    name = "module_version",
                    type = "text",
                    placeholder = "v1"
                  })
                  return label({
                    ["for"] = "module_version"
                  }, "Module Version")
                end)
                return div({
                  class = "input-field col s2"
                }, function()
                  return button({
                    class = "btn waves-effect waves-light full-size-hor",
                    type = "submit"
                  }, "submit")
                end)
              end)
            end)
          end)
          element("table", {
            class = "striped centered highlight"
          }, function()
            thead(function()
              return tr(function()
                th("Status")
                th("Client Version")
                th("API Endpoint")
                th("API Module")
                th("Module Version")
                return th("Action")
              end)
            end)
            return tbody(function()
              for key, value in pairs(self.rules) do
                tr({
                  ["data-id"] = self.rules[key]['id']
                }, function()
                  td(function()
                    return div({
                      class = "switch"
                    }, function()
                      return label(function()
                        input({
                          id = "toggle-rule",
                          type = "checkbox",
                          checked = self.rules[key]['is_active']
                        })
                        return span({
                          class = "lever"
                        })
                      end)
                    end)
                  end)
                  td(function()
                    span({
                      id = "client_version",
                      class = "active-rule"
                    }, self.rules[key]['client_version'], function() end)
                    return div({
                      class = "modify-rule no-mar-top input-field"
                    }, function()
                      return input({
                        class = inp_css,
                        required = true,
                        ["data-length"] = "10",
                        name = "client_version",
                        type = "text",
                        placeholder = "v1.0.1",
                        value = self.rules[key]['client_version']
                      })
                    end)
                  end)
                  td(function()
                    span({
                      id = "endpoint",
                      class = "active-rule"
                    }, self.rules[key]['endpoint'], function() end)
                    return div({
                      class = "modify-rule no-mar-top input-field"
                    }, function()
                      return input({
                        class = inp_css,
                        required = true,
                        name = "endpoint",
                        type = "text",
                        placeholder = "/my-api/end",
                        value = self.rules[key]['endpoint']
                      })
                    end)
                  end)
                  td(function()
                    span({
                      id = "module",
                      class = "active-rule"
                    }, self.rules[key]['module'], function() end)
                    return div({
                      class = "modify-rule no-mar-top input-field"
                    }, function()
                      return input({
                        class = inp_css,
                        required = true,
                        name = "module",
                        type = "text",
                        placeholder = "KE",
                        value = self.rules[key]['module']
                      })
                    end)
                  end)
                  td(function()
                    span({
                      id = "module_version",
                      class = "active-rule"
                    }, self.rules[key]['module_version'], function() end)
                    return div({
                      class = "modify-rule no-mar-top input-field"
                    }, function()
                      return input({
                        class = inp_css,
                        required = true,
                        ["data-length"] = "10",
                        name = "module_version",
                        type = "text",
                        placeholder = "v1",
                        value = self.rules[key]['module_version']
                      })
                    end)
                  end)
                  return td(function()
                    div({
                      class = "active-rule actions"
                    }, function()
                      button({
                        class = "waves-effect waves-light cyan btn-floating",
                        id = "modify-toggle"
                      }, function()
                        return i({
                          class = "material-icons"
                        }, "edit")
                      end)
                      return button({
                        class = "waves-effect waves-light orange btn-floating",
                        id = "delete-rule"
                      }, function()
                        return i({
                          class = "material-icons"
                        }, "remove_circle")
                      end)
                    end)
                    return div({
                      class = "modify-rule"
                    }, function()
                      return button({
                        class = "btn waves-effect waves-light blue lighten-1",
                        id = "modify-rule"
                      }, "submit")
                    end)
                  end)
                end)
              end
            end)
          end)
          return raw([[ <script>$(function() {
          $('#client-version, #api-version').characterCounter();
          $('#add-rule').on('click',function(){$('#new-rule').toggle();});

          $('label #toggle-rule').on('click',function(){
            ajaxReq('PUT', extractAttr($(this).parents('tr')));
          });

          $('.actions #modify-toggle').on('click',function(){
            var parent = $(this).parents('tr')
            parent.find('.modify-rule').toggle()
            parent.find('.active-rule').toggle()
          });

          $('.modify-rule #modify-rule').on('click',function(){
            var parent = $(this).parents('tr')
            pushInput(parent,"client_version")
            pushInput(parent,"endpoint")
            pushInput(parent,"module")
            pushInput(parent,"module_version")

            ajaxReq('PUT', extractAttr($(this).parents('tr')));
          });

          $('.actions #delete-rule').on('click',function(){
            ajaxReq('DELETE', extractAttr($(this).parents('tr')));
          });

          function pushInput(parent, target) {
            parent.find("#"+target).text(parent.find("input[name="+target+"]").val());
          }

          function ajaxReq(method, data, callback) {
            $.ajax({
              type: method,
              data: JSON.stringify(data),
              dataType: 'json',
              success: callback,
              success: function(res){alert(res['message']);location.reload();},
              contentType: "application/json; charset=UTF-8"
            });
          }

          function extractAttr(parent){
            return {
              id: parent.attr('data-id'),
              client_version: parent.find('#client_version').text(),
              endpoint: parent.find('#endpoint').text(),
              module: parent.find('#module').text(),
              module_version: parent.find('#module_version').text(),
              is_active: parent.find('#toggle-rule').prop('checked'),
            }
          }

        });</script> ]])
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
