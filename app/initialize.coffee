window.App = Em.Application.create()

require 'application'

require 'webServiceConnection'

###############################
## Helpers
###############################

###############################
## Models
###############################

###############################
## Controls
###############################
require 'controls/navbar/navbar'
require 'controls/footer/footer'

###############################
## Pages
###############################
require 'pages/home/home'

#################################
## Define Routes Here
#################################

App.Router.map ->
  @route 'home', { path: "/" }

##################################
## Define navigation here
##################################

# App.NavBarMap = [
#   { key: "home", label: "home", image: "", children: [
#     { key: "home.login", label: "login" }]}
# ]

