App.Message = DS.Model.extend
  text: DS.attr()

App.HomeRoute = Ember.Route.extend
  model: ->
    @store.find('message', 1)

App.HomeController = Ember.ObjectController.extend()
