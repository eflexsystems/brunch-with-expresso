express      = require 'express'
routes       = require './routes'
http         = require 'http'
path         = require 'path'
socketio     = require 'socket.io'
cookieParser = require 'cookie-parser'
bodyParser   = require 'body-parser'
session      = require 'express-session'
logger       = require 'morgan'
errorHandler = require 'errorHandler'

app = express()

app.use(cookieParser())
app.use(bodyParser())
app.use(logger('dev'))
app.use(bodyParser())
app.use(express.static(path.join(__dirname, 'public')))

env = process.env.NODE_ENV || 'development'
if env == 'development'
  app.use(errorHandler())

app.get('/hello', routes.hello)

exports.startServer = (port, path, callback) ->
  server = http.createServer(app)
  io = socketio.listen(server)
  server.listen(port, callback)

