express = require('express')
app = express()
server = require('http').createServer(app)

app.configure () ->
	app.use(express.bodyParser())
	app.use(express.cookieParser())
	app.use(express.methodOverride())
	app.use(app.router)

# DEMO
snowshoestamp = require './snowshoestamp'

auth = new snowshoestamp('0ce618911082c8862495', '02cdd95d9c917cf66dd73f7d9ed2208d56e1845a')

app.all '/snowshoecallback', (req, res) ->
	auth.validateStamp(req.body)

app.get '/stampscreen', (req, res) ->
	auth.stampScreen(req, res)

port = process.env.PORT or 3000
server.listen port, () -> 
  console.log "Server running on port " + port

