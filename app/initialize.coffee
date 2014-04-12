window.App = Em.Application.create()

# don't conflict with ember helpers
delete Swag.helpers.partial
delete Swag.helpers.log

Swag.registerHelpers()

require 'overrides'
require 'webServiceConnection'

folderOrder = [
  'helpers', 'models', 'controls', 'pages'
]

for folder in folderOrder
  regex = new RegExp("^#{folder}/")
  window.require
    .list()
    .filter((module) -> regex.test(module))
    .forEach(require)

require 'routing'

require 'application'
require 'main'
