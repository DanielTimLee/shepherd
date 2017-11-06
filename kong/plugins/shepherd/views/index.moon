import Widget from require "lapis.html"


class Index extends Widget
  content: =>

    div class: "section no-pad-top", ->
      div class: "container", ->

        raw [[ <style> #act-btn-box{position:relative;height:5rem}#act-btn{position:absolute;display:inline-block;right:2rem}#new-rule{display:none} </style> ]]

        div id: "act-btn-box", ->
          div class: "fixed-action-btn horizontal click-to-toggle", id: "act-btn", ->
            a class: "btn-floating btn-large pulse red", ->
              i class: "large material-icons", "menu"
            ul ->
              li -> a class: "btn-floating blue", id: "add-rule", -> i class: "material-icons", "add"
              li -> a class: "btn-floating green", -> i class: "material-icons", "edit"
              li -> a class: "btn-floating yellow darken-1", -> i class: "material-icons", "search"

        div class: "row", id: "new-rule", ->
          form class: "col s12", method: "POST",  ->
            div class: "row", ->
              div class: "input-field col s3", ->
                input class: "validate", required: true, "data-length": "10", name: "client_version", type: "text", placeholder: "v1.0.1"
                label for: "client_version", "Client Version"
              div class: "input-field col s3", ->
                input class: "validate", required: true, name: "endpoint", type: "text", placeholder: "/my-api/end"
                label for: "endpoint", "API Endpoint"
              div class: "input-field col s2", ->
                input class: "validate", required: true, name: "module", type: "text", placeholder: "KE"
                label for: "module", "API Module"
              div class: "input-field col s2", ->
                input class: "validate", required: true, "data-length": "10", name: "module_version", type: "text", placeholder: "v1"
                label for: "module_version", "Module Version"
              div class: "input-field col s2", ->
                button class:"btn waves-effect waves-light", type: "submit", "submit"

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
            for key, value in pairs @rules
              tr "data-id": @rules[key]['id'], ->
                td ->
                  div class: "switch", ->
                    label ->
                      input id: "toggle-rule", type: "checkbox", checked: @rules[key]['is_active']
                      span class: "lever"

                td id: "client_version", @rules[key]['client_version']
                td id: "endpoint", @rules[key]['endpoint']
                td id: "module", @rules[key]['module']
                td id: "module_version", @rules[key]['module_version']
                td ->
                  div class: "actions", ->
                    button class: "waves-effect waves-light cyan btn-floating", ->
                      i class: "material-icons", "edit"
                    button class: "waves-effect waves-light orange btn-floating", id: "delete-rule", ->
                      i class: "material-icons", "remove_circle"


        raw[[ <script>$(function() {
          $('#client-version, #api-version').characterCounter();
          $('#add-rule').on('click',function(){$('#new-rule').toggle();});

          $('label #toggle-rule').on('click',function(){
            ajaxReq('PUT', extractAttr($(this).parents('tr')));
          });

          $('.actions #delete-rule').on('click',function(){
            ajaxReq('DELETE', extractAttr($(this).parents('tr')));
          });

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

        });</script> ]]
