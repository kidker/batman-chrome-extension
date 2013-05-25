Batman.extend Batman.config,
  pathToApp: '/views/panel.html'

Batman.View::cache = false

class window.Batbelt extends Batman.App
  @root 'dashboard#index'

  @sendMessage: (msg, cb) ->
    cb ?= ->
    data =
      tabId: chrome.devtools.inspectedWindow.tabId
      data: msg
    chrome.runtime.sendMessage data, cb
