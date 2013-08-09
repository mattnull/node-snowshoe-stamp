request = require 'request'

module.exports = class SnowShoeStamp

	constructor : (@apiKey, @apiSecret) ->
		@baseURI = 'https://beta.snowshoestamp.com/api/v2'
	
	stampScreen : (req, res) ->
		res.redirect "http://beta.snowshoestamp.com/applications/client/#{@apiKey}"

	validateStamp : (data, cb) ->
		cb = cb ? () ->
		oauth =
			consumer_key: @apiKey
			consumer_secret: @apiSecret

		url = "#{@baseURI}/stamp"

		request.post {
			url : url, 
			oauth : oauth, 
			form : data
		}, (e, r, body) ->
			console.log body
			cb(body)