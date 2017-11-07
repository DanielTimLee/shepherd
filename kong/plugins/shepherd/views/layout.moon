html = require "lapis.html"

-- TODO: [QST] don"t know how to import CSS with Kong wrapped Lapis.

cdnICON = "https://fonts.googleapis.com/icon?family=Material+Icons"
cdnCSS = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"
cdnJS = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"
jqJS = "https://code.jquery.com/jquery-3.2.1.min.js"

class Layout extends html.Widget
  content: =>
    html_5 ->
      head ->
        script src: jqJS
        script src: cdnJS
        title "Shepherd Dashboard"
        link rel: "stylesheet", href: cdnCSS
        link rel: "stylesheet", href: cdnICON

        raw [[ <style> body{display:flex;min-height:100vh;flex-direction:column}main{flex:1 0 auto} </style> ]]

      body ->
        header ->
          nav role: "navigation", ->
            div class: "nav-wrapper container", ->
              a class: "brand-logo", href: "#", ->
                text "Shepherd Dashboard"

        main ->
          div class: "section no-pad-bot", ->
            div class: "container", ->
              h1 class: "header center light-blue-text text-lighten-1", "Shepherd"
              div class: "row center", ->
                h5 class: "header col s12 light", "Client Versioning Redirect with API Endpoint, Modules"

          @content_for "inner"

          div class: "section"
          div class: "section"

        footer class: "page-footer", ->
          div class: "container", ->
            div class: "row", ->
              div class: "col l6 s12", ->
                h5 class: "white-text", "Shepherd Plugin"
                p class: "gray-text text-lighten-4", "Plugin for Client Versioning and Redirect with API Endpoint, Modules"

              div class: "col l4 offset-l2 s12", ->
                h5 class: "white-text", "Links"
                ul ->
                  li -> a class: "grey-text text-lighten-3", href: "http://dbrain.science", "dBrainScience Homepage"

          div class: "footer-copyright", ->
            div class: "container", ->
              text "© 2017 Copyright dBrainScience"

