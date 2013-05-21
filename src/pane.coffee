class window.Batbelt.Pane
  init: ->
    @injectDebugger()
    chrome.devtools.panels.create 'Batman', 'img/logo.png', 'views/panel.html', (panel) =>
      panel.onShown.addListener @onShownHandler

  injectDebugger: ->
    url = chrome.extension.getURL 'dist/batman.debug.js'

    xhr = new XMLHttpRequest()
    xhr.open('GET', url, false)
    xhr.send()

    chrome.devtools.inspectedWindow.eval xhr.responseText

  sendMessage: (msg, cb) ->
    chrome.runtime.sendMessage {tabId: chrome.devtools.inspectedWindow.tabId, data: msg}, cb

  onShownHandler: =>
    @sendMessage {type: 'ping'}, (res) ->
      console.log 'response', res
