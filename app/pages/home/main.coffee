App.HomeRoute = Ember.Route.extend
  model: ->
    App.ajaxGet('hello')

App.HomeController = Ember.ObjectController.extend()
