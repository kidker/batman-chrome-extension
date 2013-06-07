class Batbelt.DashboardController extends Batman.Controller
  routingKey: 'dashboard'

  @accessor 'statKeys', -> @get('stats')?.keys()

  index: ->
    @set('stats', new Batman.Hash)
    @_updateStats()

  _updateStats: =>
    stats = @get('stats')
    Batbelt.sendMessage {type: 'stats'}, (results) =>
      stats.set(stat, count) for own stat, count of results
      setTimeout(@_updateStats, 1000)
