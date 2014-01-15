# Create another global variable for simpler syntax.
window.expect = chai.expect

require 'initialize'
App = window.App

App.rootElement = '#mocha-app-body'
App.setupForTesting()
App.injectTestHelpers()
Ember.Test.adapter = Ember.Test.MochaAdapter.create()

window.exists = (selector) ->
  !!find(selector).length
