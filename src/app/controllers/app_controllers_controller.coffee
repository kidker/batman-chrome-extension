class Batbelt.AppControllersController extends Batman.Controller
  routingKey: 'app_controllers'

  index: ->
    Batbelt.AppController.load @errorHandler (controllers) ->
      @set('controllers', controllers)

  show: (params) ->
    Batbelt.AppController.find params.id, @errorHandler (controller) ->
      @set('controller', controller)
