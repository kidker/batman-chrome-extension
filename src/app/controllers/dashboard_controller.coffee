class Batbelt.DashboardController extends Batman.Controller
  routingKey: 'dashboard'

  show: (params) ->
    @set 'dashboard', dash = new Batbelt.Dashboard

    Batbelt.DebugController.load @errorHandler (controllers) ->
      dash.set('controllers', controllers)

    Batbelt.DebugModel.load @errorHandler (models) ->
      dash.set('models', models)

    Batbelt.DebugView.load @errorHandler (views) ->
      dash.set('views', views)
