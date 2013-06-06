class Batbelt.AppController extends Batman.Model
  @resourceName: 'app_controller'

  @persist Batbelt.Storage

  @mixin Batbelt.AppObservable

  @encode 'name', 'action', 'path', 'current'

  @encode 'properties',
    decode: (obj) -> new Batman.Hash(obj)

  @accessor 'currentRouteWithKey', ->
    name = @get('name').substring(0, @get('name').length-"Controller".length)
    "#{Batman.helpers.underscore(name)}##{@get('action')}"