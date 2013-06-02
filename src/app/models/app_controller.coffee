class Batbelt.AppController extends Batman.Model
  @resourceName: 'app_controller'

  @persist Batbelt.Storage

  @classMixin Batbelt.AppObservable

  @encode 'name', 'action', 'path', 'current'
