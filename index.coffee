tvdbWebService = require 'tvdbwebservice'
express = require 'express'
app = express()

app.set 'port', (process.env.PORT)
app.set 'tvdbApikey', (process.env.TVDB_API_KEY)

tvdbWebService.setTvdbApiKey app.get 'tvdbApikey'

app.get '/series/seriesName/:name', (req, res) ->
  tvdbWebService.getSeriesByName req.params.name, (data) ->
  	res.end data
  	return
  return


# responds to requests for series with given id for series data + actors  + banners
app.get '/series/seriesId/:id/seriesPlusActorsPlusBanners',  (req, res) ->
  tvdbWebService.getSeriesPlusActorsPlusBanners req.params.id, (data) ->
  	res.end data
  	return
  return
# responds to requests for series with given id for seriesData only
app.get '/series/seriesId/:id/seriesOnly', (req, res) ->
  tvdbWebService.getSeriesOnlyById req.params.id, (data) ->
  	res.end data
  	return
  return


# responds to requests for actors of series with given id
app.get '/series/seriesId/:id/actors',  (req, res) ->
  tvdbWebService.getActorsForSeriesWithId req.params.id, (data) ->
  	res.end data
  	return
  return

# responds to requests for banners of series with given id
app.get '/series/seriesId/:id/banners/', (req, res) ->
  tvdbWebService.getBannersForSeriesWithId req.params.id, (data) ->
  	res.end data
  	return
  return

app.get '/', (req, res)  ->
  response.end 'Welcome to tvserieswebserver'


app.listen app.get 'port' , ->
  console.log "Node app is running at" + app.get 'port'
  return



