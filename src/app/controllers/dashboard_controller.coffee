class Batbelt.DashboardController extends Batman.Controller
  routingKey: 'dashboard'

  show: (params) ->
    @set 'dashboard', dash = new Batbelt.Dashboard

    Batbelt.AppController.load @errorHandler (controllers) ->
      dash.set('controllers', controllers)

    Batbelt.AppModel.load @errorHandler (models) ->
      dash.set('models', models)

    Batbelt.AppView.load @errorHandler (views) ->
      dash.set('views', views)
