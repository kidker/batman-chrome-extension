class Batbelt.DashboardController extends Batman.Controller
  routingKey: 'dashboard'

  index: ->
    Batbelt.AppController.load @errorHandler (controllers) =>
      @set('controllers', controllers)

    Batbelt.AppModel.load @errorHandler (models) =>
      @set('models', models)

    Batbelt.AppView.load @errorHandler (views) =>
      @set('views', views)
