class window.BatmanDebug
  @objectMap = new Batman.Hash
  @observerMap = new Batman.Hash

  init: ->
    @messageListener()

  messageListener: ->
    window.addEventListener 'message', (event) =>
      if event.data.for is 'batman.debug'
        @handleMessage event.data.data, (res, options = {}) =>
          data = JSON.stringify(BatmanDebug.prettify(res))
          window.postMessage {id: event.data.id, for: 'batbelt', data, options}, '*'

  handleMessage: (msg, cb) ->
    switch msg.type
      when 'ping'
        cb type: 'pong'
      when 'storageAdapter'
        @storageAdapter(msg.key, msg.options, cb)
      when 'observeLoadedProperty'
        @observeLoadedProperty(msg.id, msg.property, cb)
      when 'startObservingEvents'
        @startObservingEvents(msg.keypath, cb)
      when 'stopObservingEvents'
        @stopObservingEvents(msg.keypath, cb)
      else
        console.log 'Unknown message', msg

  storageAdapter: (key, options, cb) ->
    [action, modelName] = key.split('::')
    modelName = Batman.helpers.camelize(modelName)

    BatmanDebug[modelName][action] options, (res) ->
      cb(res, {close: true})

  observeLoadedProperty: (id, property, cb) ->
    BatmanDebug.objectMap.get(id)?.observe property, (newValue) ->
      cb(newValue, {close: false})

  startObservingEvents: (keypath, cb) ->
    property = Batman.currentApp.get(keypath)
    @stopObservingEvents(keypath)

    return unless property
    BatmanDebug.observerMap.set(keypath, property)

    property.debug_fire = property.fire
    property.fire = (key, args...) ->
      eventForKey = @event(key, false)
      if eventForKey
        cb key: key, prevented: eventForKey.isPrevented(), listeners: eventForKey.handlers?.length
      else
        cb key: key, prevented: null, listeners: 0
      @debug_fire.apply(this, arguments)

  stopObservingEvents: (keypath, cb) ->
    if oldProperty = BatmanDebug.observerMap.get(keypath)
      if oldProperty.debug_fire
        oldProperty.fire = oldProperty.debug_fire
        delete oldProperty.debug_fire

class BatmanDebug.AppController
  constructor: (@name) ->
    instanceName = @name.substr(0, @name.length - 'Controller'.length)
    @instanceName = Batman.helpers.underscore(instanceName)
    @instance = Batman.currentApp.get("controllers.#{instanceName}")
    BatmanDebug.objectMap.set(@instance._batmanID(), @instance)

  isCurrentController: ->
    Batman.currentApp.get('currentRoute.controller') is @instanceName

  toJSON: ->
    obj = BatmanDebug.prettify(@instance)
    obj.id = @instance._batmanID()
    obj.name = @name
    obj.action = @instance.get('action')
    obj.path = @instance.get('params.path')
    obj.current = @isCurrentController()
    obj

  @readAll: (options, cb) ->
    controllers = []
    for own name, attr of Batman.currentApp
      if attr.prototype instanceof Batman.Controller
        controller = new @(name)
        controllers.push(controller.toJSON())

    cb(controllers)

class BatmanDebug.AppModel
  constructor: (@name) ->
    @instances = Batman.currentApp[@name].get('loaded')
    @instances.forEach (instance) ->
      BatmanDebug.objectMap.set(instance._batmanID(), instance)

  serializeInstances: ->
    @instances.map (model) ->
      id: model._batmanID()
      properties: model.toJSON()

  toJSON: ->
    name: @name
    instances: @serializeInstances()

  @readAll: (options, cb) ->
    models = []
    for own name, attr of Batman.currentApp
      if attr.prototype instanceof Batman.Model
        model = new @(name)
        if model.instances.length
          models.push(model.toJSON())

    cb(models)

class BatmanDebug.AppView
  @readAll: (options, cb) ->
    views = []
    for own name, attr of Batman.currentApp
      views.push({name}) if attr.prototype instanceof Batman.Model

    cb(views)


if window.Batman?.currentApp
  app = window.Batman.currentApp
  app.debug = new BatmanDebug(app)
  app.debug.init()
