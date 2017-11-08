import Widget from require "lapis.html"

inp_css = "validate no-mar-bot"

class Index extends Widget
  content: =>

    div class: "section no-pad-top", ->
      div class: "container", ->

        raw [[ <style>
        .no-mar{margin:0px !important}.no-mar-top{margin-top:0px !important}.no-mar-bot{margin-bottom:0px !important}
        .full-size-hor{width:100%}
        #act-btn-box{position:relative;height:5rem}#act-btn{position:absolute;display:inline-block;right:2rem}
        #new-rule{display:none}.modify-rule{display:none}
        </style> ]]

        div id: "act-btn-box", ->
          div class: "fixed-action-btn horizontal click-to-toggle", id: "act-btn", ->
            a class: "btn-floating btn-large pulse red", ->
              i class: "large material-icons", "menu"
            ul ->
              li -> a class: "btn-floating blue", id: "add-rule", -> i class: "material-icons", "add"
              li -> a class: "btn-floating green", -> i class: "material-icons", "edit"
              li -> a class: "btn-floating yellow darken-1", -> i class: "material-icons", "search"

        div class: "row no-mar", id: "new-rule", ->
          form class: "col s12", method: "POST",  ->
            div class: "row", ->
              div class: "input-field col s3", ->
                input class: inp_css, required: true, "data-length": "10", name: "client_version", type: "text", placeholder: "v1.0.1"
                label for: "client_version", "Client Version"
              div class: "input-field col s3", ->
                input class: inp_css, required: true, name: "endpoint", type: "text", placeholder: "/my-api/end"
                label for: "endpoint", "API Endpoint"
              div class: "input-field col s2", ->
                element "select", name: "module", ->
                  option disabled: true, selected: true, "Choose Kong API"
                  for key, api in pairs @apis
                    option value: api["uris"][1], api["name"].." ( "..api["uris"][1].." ) "
                label for: "module", "API Module"
              div class: "input-field col s2", ->
                input class: inp_css, required: true, "data-length": "10", name: "module_version", type: "text", placeholder: "v1"
                label for: "module_version", "Module Version"
              div class: "input-field col s2", ->
                button class:"btn waves-effect waves-light full-size-hor", type: "submit", "submit"

        element "table", class: "striped centered highlight", ->
          thead ->
            tr ->
              th "Status"
              th "Client Version"
              th "API Endpoint"
              th "API Module"
              th "Module Version"
              th "Action"

          tbody ->
            for key, rule in pairs @rules
              tr "data-id": rule["id"], ->
                td ->
                  div class: "switch", ->
                    label ->
                      input id: "toggle-rule", type: "checkbox", checked: rule["is_active"]
                      span class: "lever"

                td ->
                  span id: "client_version", class: "active-rule", rule["client_version"], ->
                  div class: "modify-rule no-mar-top input-field", ->
                    input class: inp_css, required: true, "data-length": "10", name: "client_version", type: "text", placeholder: "v1.0.1", value: rule["client_version"]

                td ->
                  span id: "endpoint", class: "active-rule", rule["endpoint"], ->
                  div class: "modify-rule no-mar-top input-field", ->
                    input class: inp_css, required: true, name: "endpoint", type: "text", placeholder: "/my-api/end", value: rule["endpoint"]

                td ->
                  span id: "module", class: "active-rule", rule["module"], ->

                  div class: "modify-rule no-mar-top", ->
                    element "select", class: 'browser-default', name: "module", ->
                      option disabled: true, "Choose Kong API"
                      for key, api in pairs @apis
                        option value: api["uris"][1], selected: rule["module"] == api['uris'][1], ->
                          text api["name"].." ( "..api["uris"][1].." ) "

                td ->
                  span id: "module_version", class: "active-rule", rule["module_version"], ->
                  div class: "modify-rule no-mar-top input-field", ->
                    input class: inp_css, required: true, "data-length": "10", name: "module_version", type: "text", placeholder: "v1", value: rule["module_version"]

                td ->
                  div class: "active-rule actions", ->
                    button class: "waves-effect waves-light cyan btn-floating", id: "modify-toggle", ->
                      i class: "material-icons", "edit"
                    button class: "waves-effect waves-light orange btn-floating", id: "delete-rule", ->
                      i class: "material-icons", "remove_circle"

                  div class: "modify-rule", ->
                    button class:"btn waves-effect waves-light blue lighten-1", id: "modify-rule", "submit"



        raw[[ <script>
          $(function () {
            $("#client-version, #api-version").characterCounter();
            $("#add-rule").on("click", function () {
              var newRule = $("#new-rule")
              newRule.toggle();
              newRule.find('select').material_select();
            });

            $("label #toggle-rule").on("click", function () {
              ajaxReq("PUT", extractAttr($(this).parents("tr")));
            });

            $(".actions #modify-toggle").on("click", function () {
              var parent = $(this).parents("tr")
              parent.find(".modify-rule").toggle()
              parent.find(".active-rule").toggle()
            });

            $(".modify-rule #modify-rule").on("click", function () {
              var parent = $(this).parents("tr")
              pushInput(parent, "input", "client_version")
              pushInput(parent, "input", "endpoint")
              pushInput(parent, "select", "module")
              pushInput(parent, "input", "module_version")

              ajaxReq("PUT", extractAttr($(this).parents("tr")));
            });

            $(".actions #delete-rule").on("click", function () {
              ajaxReq("DELETE", extractAttr($(this).parents("tr")));
            });

            function pushInput(parent, type, target) {
              parent.find("#" + target).text(parent.find(type + "[name=" + target + "]").val());
            }

            function ajaxReq(method, data, callback) {
              $.ajax({
                type: method,
                data: JSON.stringify(data),
                dataType: "json",
                success: callback,
                success: function (res) {
                  alert(res["message"]);
                  location.reload();
                },
                contentType: "application/json; charset=UTF-8"
              });
            }

            function extractAttr(parent) {
              return {
                id: parent.attr("data-id"),
                client_version: parent.find("#client_version").text(),
                endpoint: parent.find("#endpoint").text(),
                module: parent.find("#module").text(),
                module_version: parent.find("#module_version").text(),
                is_active: parent.find("#toggle-rule").prop("checked"),
              }
            }
          });</script> ]]
