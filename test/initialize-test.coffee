require 'initialize'
require 'test/test-helpers'
App = window.App

App.rootElement = '#mocha-app-body'
App.setupForTesting()
App.injectTestHelpers()

folders = ['fixtures', 'unit']

files = window.require.list()

for folder in folders
  regex = ///^test/#{folder}///
  modules = files
    .filter((module) -> regex.test(module))
    .forEach(require)

beforeEach ->
  App.reset()
  @sandbox = sinon.sandbox.create()

afterEach ->
  @sandbox.restore()
