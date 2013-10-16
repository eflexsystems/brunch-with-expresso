App.ajax = (type, url, data, content) ->
  $.ajax
    url: App.configuration.servicePrefix + url
    dataType: 'json'
    type: type ? 'GET'
    data: data ? {}

App.ajaxGet = (url, data, emberClass) ->
  request = App.ajax('GET', url, data)

  if emberClass?
    request.then (data) ->
      if _.isArray(data)
        emberClass.createMany(data)
      else
        emberClass.create(data)
  else
    request

App.ajaxPost = (url, data) ->
  App.ajax('POST', url, data)

App.ajaxPut = (url, data) ->
  App.ajax('PUT', url, data)

App.ajaxDelete = (url, data) ->
  App.ajax('DELETE', url, data)

