class Batbelt.AppControllersController extends Batman.Controller
  routingKey: 'app_controllers'

  @accessor 'currentController', ->
    for controller in @get('controllers')
      return controller if controller.get('current')

  index: ->
    Batbelt.AppController.load @errorHandler (controllers) ->
      @set('controllers', controllers)
      @set('activeController', _getCurrentController(controllers))

  show: (params) ->
    Batbelt.AppController.find params.id, @errorHandler (controller) ->
      @set('controller', controller)

  setActive: (controller) -> @set('activeController', controller)

  _getCurrentController: (controllers) ->
    for controller in controllers
      return controller if controller.get('current')
