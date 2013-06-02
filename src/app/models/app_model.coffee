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
    decode: (obj) ->
      properties = new Batman.Set
      properties.add(new Batman({key, value})) for key, value of obj
      return properties

  @belongsTo 'app_model'
