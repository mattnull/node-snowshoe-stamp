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

auth = new snowshoestamp('APIKEY', 'APISECRET')

app.all '/snowshoecallback', (req, res) ->
	auth.validateStamp(req.body)

app.get '/stampscreen', (req, res) ->
	auth.stampScreen(req, res)

port = process.env.PORT or 3000
server.listen port, () -> 
  console.log "Server running on port " + port

