express  = require('express')
routes   = require('./routes')
http     = require('http')
path     = require('path')
socketio = require('socket.io')

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
  server = http.createServer(app)
  io = socketio.listen(server)
  server.listen(port, callback)

