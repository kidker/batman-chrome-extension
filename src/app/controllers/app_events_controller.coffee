class Batbelt.AppEventsController extends Batman.Controller
  routingKey: 'app_events'

  index: ->
    @set('dirtyKeypath', '')
    @set('keypath', new Batbelt.AppKeypath)

  commitKeypath: ->
    @set('keypath.key', @get('dirtyKeypath'))
