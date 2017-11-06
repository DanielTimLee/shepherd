import Widget from require "lapis.html"


class Index extends Widget
  content: =>
    div class: "section no-pad-bot", ->
      div class: "container", ->
        element "table", class: "striped centered highlight", ->
          thead ->
            tr ->
              th "Client Version"
              th "API Endpoint"
              th "API Module"
              th "API Version"
              th "Action"

          tbody ->
            tr ->
              td "v1.0.1"
              td "/kaiser/keyword"
              td "KE"
              td "v1"
              td ->
                a class: "waves-effect waves-light blue btn-floating", ->
                  i class: "material-icons", "edit"
                br
                a class: "waves-effect waves-light red btn-floating", ->
                  i class: "material-icons", "remove_circle"
