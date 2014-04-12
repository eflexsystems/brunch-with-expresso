App.Serializable = Ember.Mixin.create
  skipTypes: ['isInstance', 'isDestroyed', 'isDestroying', 'concatenatedProperties']

  serialize: ->
    result = {}
    for key of $.extend(true, {}, this)
      if key not in @skipTypes && typeof this[key] != "function"
        result[key] = this[key]
    result
