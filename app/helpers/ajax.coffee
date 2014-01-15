App.ajax = (type, url, data, content) ->
  options =
    url: App.configuration.servicePrefix + "/" + url
    dataType: 'json'
    type: type ? 'GET'

  if type != 'GET' && type != 'DELETE'
    options.contentType = 'application/json'
    options.data = if data? then JSON.stringify(data) else {}
  else
    options.data = data ? {}

  req = $.ajax(options)

  if emberClass?
    req = req.then (data) ->
      if _.isArray(data)
        emberClass.createMany(data)
      else
        emberClass.create(data)

  new Ember.RSVP.Promise (resolve, reject) ->
    req.then(resolve)
    req.fail(reject)

App.ajaxGet = (url, data, emberClass) ->
  App.ajax('GET', url, data, emberClass)

App.ajaxPost = (url, data, emberClass) ->
  App.ajax('POST', url, data, emberClass)

App.ajaxPut = (url, data, emberClass) ->
  App.ajax('PUT', url, data, emberClass)

App.ajaxDelete = (url, data) ->
  App.ajax('DELETE', url, data)

