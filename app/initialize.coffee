window.App = Em.Application.create()

require 'overrides'

folderOrder = [
  'helpers', 'models', 'controls', 'pages'
]

files = window.require.list()

for folder in folderOrder
  regex = ///^#{folder}///

  files
    .filter((module) -> regex.test(module))
    .forEach(require)

require 'routing'

require 'application'
require 'main'
