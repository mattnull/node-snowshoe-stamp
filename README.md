# Node.js SDK for SnowShoe Stamp

## Download
The source is available for download from GitHub. Alternatively, you can install using Node Package Manager (npm):

`npm install node-snowshoe-stamp`

## Example
```coffeescript
SnowShoeStamp = require './snowshoestamp'

auth = new SnowShoeStamp('APIKEY', 'APISECRET')

# snowshoe api callback
app.all '/snowshoecallback', (req, res) ->
	auth.validateStamp(req.body)

# render snowshoe stamp screen
app.get '/stampscreen', (req, res) ->
	auth.stampScreen(req, res)
```

## Development
### Dependencies

This command needs to be ran first if CoffeeScript is not installed on your system

* run `sudo npm install -g coffee-script`

### Setup

Install all of the dependencies

* run `npm install`

The following command will watch and compile Coffeescript
* run `cake dev`

