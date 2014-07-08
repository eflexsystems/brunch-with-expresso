Ember.Object.reopenClass
  createMany: (data) ->
    if data?
      @create(i) for i in data

Ember.View.reopen
  didInsertElement: ->
    @_super()
    Ember.run.scheduleOnce('afterRender', this, @afterRenderEvent)
    
  afterRenderEvent: ->
