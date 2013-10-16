express = require('express')
routes  = require('./routes')
http    = require('http')
path    = require('path')

app = express()
app.use(express.favicon())
app.use(express.logger('dev'))
app.use(express.bodyParser())
app.use(express.methodOverride())
app.use(app.router)
app.use(express.static(path.join(__dirname, 'public')))

app.get('/hello', routes.hello)

if app.get('env') == 'development'
  app.use(express.errorHandler())

exports.startServer = (port, path, callback) ->
  http.createServer(app).listen port, ->
    console.log "Listening on port: #{port}"
    callback()
