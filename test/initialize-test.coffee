require 'initialize'
require 'test/test-helpers'
App = window.App

App.rootElement = '#mocha-app-body'
App.setupForTesting()
App.injectTestHelpers()

folders = ['fixtures', 'unit']

for folder in folders
  regex = new RegExp("^text/#{folder}/")
  modules = window.require
    .list()
    .filter((module) -> regex.test(module))
    .forEach(require)
