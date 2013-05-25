class window.BatmanDebug
  init: ->
    @messageListener()

  messageListener: ->
    window.addEventListener 'message', (event) =>
      if event.data.for is 'batman.debug'
        @handleMessage event.data.data, (res) ->
          window.postMessage {id: event.data.id, from: 'batman.debug', data: res}, '*'

  handleMessage: (msg, cb) ->
    console.log 'message received', msg
    switch msg.type
      when 'ping'
        cb type: 'pong'
      when 'storageAdapter'
        @storageAdapter(msg.key, msg.options, cb)
      else
        console.log 'Unknown message', msg

  storageAdapter: (key, options, cb) ->
    console.log 'storageAdapter args', arguments

    [action, modelName] = key.split('::')
    modelName = Batman.helpers.camelize(modelName)

    BatmanDebug[modelName][action](options, cb)


class BatmanDebug.DebugController
  @readAll: (options, cb) ->
    controllers = []
    for name, attr of Batman.currentApp
      controllers.push({name}) if attr.prototype instanceof Batman.Controller

    cb(controllers)

class BatmanDebug.DebugModel
  @readAll: (options, cb) ->
    models = []
    for name, attr of Batman.currentApp
      models.push({name}) if attr.prototype instanceof Batman.Model

    cb(models)

class BatmanDebug.DebugView
  @readAll: (options, cb) ->
    views = []
    for name, attr of Batman.currentApp
      views.push({name}) if attr.prototype instanceof Batman.Model

    cb(views)


if window.Batman?.currentApp
  app = window.Batman.currentApp
  app.debug = new BatmanDebug()
  app.debug.init()
