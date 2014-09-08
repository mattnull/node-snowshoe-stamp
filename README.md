# Node.js SDK for the SnowShoe Stamp
### http://snowshoestamp.com

<a href="https://nodei.co/npm/snowshoestamp/"><img src="https://nodei.co/npm/snowshoestamp.png?downloads=true"></a>

## Download
The source is available for download from GitHub. Alternatively, you can install using Node Package Manager (npm):

`npm install snowshoestamp`

## Example
```coffeescript
SnowShoeStamp = require 'snowshoestamp'

auth = new SnowShoeStamp('APIKEY', 'APISECRET')

# snowshoe api callback
app.all '/snowshoecallback', (req, res) ->
	auth.validateStamp req.body, (response) ->
		# do something

app.get '/stampscreen', (req, res) ->
	# redirect to stamp screen
	auth.stampScreen(req, res)
```

## Add Query Parameters to your stamp screen request

```coffeescript
# snowshoe stamp screen request
queryParams = {
	userID : '123',
	other: "abc"
}
app.get '/stampscreen' , (req, res) ->
	auth.stampScreen(req,res,queryParams)
```
### The resulting request would look like the following
```
http://beta.snowshoestamp.com/applications/client/{APIKEY}?userID=123&other=abc
```
This is helpful when you would like to pass parameters to your application in the 

## Development
### Dependencies

This command needs to be ran first if CoffeeScript is not installed on your system

* run `sudo npm install -g coffee-script`

### Setup

Install all of the dependencies

* run `npm install`

The following command will watch and compile Coffeescript
* run `cake dev`
