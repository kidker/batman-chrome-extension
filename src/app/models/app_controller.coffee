class Batbelt.AppController extends Batman.Model
  @resourceName: 'app_controller'

  @persist Batbelt.Storage

  @mixin Batbelt.AppObservable

  @encode 'name', 'action', 'path', 'current'

  @encode 'properties',
    decode: (obj) -> new Batman.Hash(obj)

  @accessor 'propertyKeys', -> @get('properties').keys()
  
  @accessor 'currentRouteWithKey', ->
    name = @get('name').substring(0, @get('name').length-"Controller".length)
    "#{Batman.helpers.underscore(name)}##{@get('action')}"

  @accessor 'id',
    get: -> @id
    set: (_, newId) ->
      @id = newId
      @initObservers()

  initObservers: ->
    @observeProperties()
    for param in ['name', 'action', 'path', 'current']
      do (param) => @appObserve param, (value) => @set(param, value)
