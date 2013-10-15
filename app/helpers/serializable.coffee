App.Serializable = Ember.Mixin.create
  serialize: ->
    result = {}
    for key of $.extend(true, {}, this)
      continue if key is "isInstance" or key is "isDestroyed" or key is "isDestroying" or key is "concatenatedProperties" or typeof this[key] is "function"
      result[key] = this[key]
    result
