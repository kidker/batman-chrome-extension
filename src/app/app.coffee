Batman.extend Batman.config,
  pathToApp: '/views/panel.html'
  pathToHTML: '/src/app/html'

Batman.View::cache = false

class window.Batbelt extends Batman.App
  @root 'dashboard#index'

  @route 'dashboard', 'dashboard#index'

  @resources 'app_controllers'
  @resources 'app_models'
  @resources 'app_views'

  @sendMessage: do =>
    messageId = 0
    callbackFunctions = {}

    port = chrome.extension.connect(name: "#{chrome.devtools.inspectedWindow.tabId}")

    port.onMessage.addListener (msg) ->
      if cb = callbackFunctions[msg.id]
        cb(msg.data)
        delete callbackFunctions[msg.id] if msg.options.close

    (msg, cb) =>
      id = messageId++
      cb ?= ->
      callbackFunctions[id] = cb
      port.postMessage(data: msg, id: id)
