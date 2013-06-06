class Batbelt.AppViewsController extends Batman.Controller
  routingKey: 'app_views'

  index: ->
    Batbelt.AppView.load @errorHandler (views) ->
      @set('views', views)

  show: (params) ->
    Batbelt.AppView.find params.id, @errorHandler (view) ->
      @set('view', view)
