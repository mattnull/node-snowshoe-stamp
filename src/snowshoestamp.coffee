request = require 'request'
queryString = require 'query-string'

module.exports = class SnowShoeStamp

	constructor : (@apiKey, @apiSecret) ->
		@baseURI = 'https://beta.snowshoestamp.com/api/v2'

	stampScreen : (req, res, queryParams) ->
		query = queryString.stringify( queryParams );
		res.redirect "http://beta.snowshoestamp.com/applications/client/#{@apiKey}?" + query

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
			cb(body)
