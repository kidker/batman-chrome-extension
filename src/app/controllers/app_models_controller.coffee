class Batbelt.AppModelsController extends Batman.Controller
  routingKey: 'app_model'

  index: ->
    Batbelt.AppModel.load @errorHandler (models) ->
      @set('models', models)

  show: (params) ->
    Batbelt.AppModel.find params.id, @errorHandler (model) ->
      @set('model', model)
