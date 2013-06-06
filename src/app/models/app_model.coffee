class Batbelt.AppModel extends Batman.Model
  @resourceName: 'app_model'

  @primaryKey: 'name'

  @persist Batbelt.Storage

  @encode 'name'

  @hasMany 'instances', name: 'AppModelInstance'

class Batbelt.AppModelInstance extends Batman.Model
  @resourceName: 'instance'

  @persist Batbelt.Storage

  @mixin Batbelt.AppObservable

  @encode 'properties',
    decode: (obj) -> new Batman.Hash(obj)

  @belongsTo 'app_model'

  @accessor 'propertyKeys', -> @get('properties').keys()

  constructor: ->
    super
    @observeProperties()
