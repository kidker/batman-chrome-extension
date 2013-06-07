class Batbelt.AppModelsController extends Batman.Controller
  routingKey: 'app_models'

  index: ->
    Batbelt.AppModel.load @errorHandler (models) =>
      @set('models', models)
      @set('activeModel', models[0])

  show: (params) ->
    Batbelt.AppModel.find params.id, @errorHandler (model) =>
      @set('model', model)

  setActive: (model) => @set('activeModel', model)
