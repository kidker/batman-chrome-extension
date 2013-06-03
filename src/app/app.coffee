Batman.extend Batman.config,
  pathToApp: '/views/panel.html'

Batman.View::cache = false

class window.Batbelt extends Batman.App
  @root 'dashboard#show'

  @sendMessage: do =>
    messageId = 0
    callbackFunctions = {}

    port = chrome.extension.connect(name: "#{chrome.devtools.inspectedWindow.tabId}")

    port.onMessage.addListener (msg) ->
      if cb = callbackFunctions[msg.id]
        cb(msg.data)

    (msg, cb) =>
      id = messageId++
      cb ?= ->
      callbackFunctions[id] = cb
      port.postMessage(data: msg, id: id)
