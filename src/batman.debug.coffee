class window.BatmanDebug
  init: ->
    @messageListener()

  messageListener: ->
    window.addEventListener 'message', (event) =>
      if event.data.for is 'batman.debug'
        @handleMessage event.data.data, (res) ->
          window.postMessage {id: event.data.id, from: 'batman.debug', data: res}, '*'

  handleMessage: (msg, cb) ->
    switch msg.type
      when 'ping'
        cb type: 'pong'
      when 'storageAdapter'
        @storageAdapter(msg.key, msg.options, cb)
      else
        console.log 'Unknown message', msg

  storageAdapter: (key, options, cb) ->
    [action, modelName] = key.split('::')
    modelName = Batman.helpers.camelize(modelName)

    BatmanDebug[modelName][action](options, cb)


class BatmanDebug.DebugController
  constructor: (@name) ->
    instanceName = @name.substr(0, @name.length - 'Controller'.length)
    @instanceName = Batman.helpers.underscore(instanceName)
    @instance = Batman.currentApp.get("controllers.#{instanceName}")

  isCurrentController: ->
    Batman.currentApp.get('currentRoute.controller') is @instanceName

  toJSON: ->
    id: @instance._batmanID()
    name: @name
    action: @instance.get('action')
    path: @instance.get('params.path')
    current: @isCurrentController()

  @readAll: (options, cb) ->
    controllers = []
    for own name, attr of Batman.currentApp
      if attr.prototype instanceof Batman.Controller
        controller = new @(name)
        controllers.push(controller.toJSON())

    cb(controllers)

class BatmanDebug.DebugModel
  @readAll: (options, cb) ->
    models = []
    for own name, attr of Batman.currentApp
      models.push({name}) if attr.prototype instanceof Batman.Model

    cb(models)

class BatmanDebug.DebugView
  @readAll: (options, cb) ->
    views = []
    for own name, attr of Batman.currentApp
      views.push({name}) if attr.prototype instanceof Batman.Model

    cb(views)


if window.Batman?.currentApp
  app = window.Batman.currentApp
  app.debug = new BatmanDebug()
  app.debug.init()
