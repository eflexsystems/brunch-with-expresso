require 'initialize'
require 'test/test-helpers'
App = window.App

App.rootElement = '#mocha-app-body'
App.setupForTesting()
App.injectTestHelpers()

folders = ['fixtures', 'unit']

for folder in folders
  modules = window.require.list().filter((module) -> new RegExp("^test/#{folder}/").test(module))
  for module in modules
    require(module)