# hack until emblem fixes depreciation warning
Ember.deprecate = ->

window.App = Em.Application.create()

delete Swag.helpers.partial
delete Swag.helpers.log
Swag.registerHelpers()

require 'overrides'
require 'webServiceConnection'

folderOrder = [
  'helpers', 'models', 'controls', 'pages'
]

for folder in folderOrder
  modules = window.require.list().filter((module) -> new RegExp("^" + folder + "/").test(module))
  for module in modules
    require(module)

require 'routing'

require 'application'
require 'main'
