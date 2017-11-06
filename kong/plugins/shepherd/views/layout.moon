html = require "lapis.html"

cdnICON = 'https://fonts.googleapis.com/icon?family=Material+Icons'
cdnCSS = 'https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css'
cdnJS = 'https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js'

class Layout extends html.Widget
  content: =>
    html_5 ->
      head ->
        link rel: "stylesheet", href: cdnICON
        link rel: "stylesheet", href: cdnCSS
        title "Shepherd Dashboard"
        script src: cdnJS

      body ->
        nav role: "navigation", ->
          div class: "nav-wrapper container", ->
            a class: "brand-logo", href: "#", ->
              text "Shepherd Dashboard"

        div class: "section no-pad-bot", ->
          div class: "container", ->
            element "p"
            h1 class: "header center light-blue-text text-lighten-1", "Shepherd"
            div class: "row center", ->
              h5 class: "header col s12 light", "Client Versioning to Redirect API Endpoint, Modules"
            div class: "row center", ->
              a class: "btn-large waves-effect waves-light light-blue lighten-1", href: "#", "Add New API"
            p

        @content_for "inner"
