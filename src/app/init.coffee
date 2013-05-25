Batbelt.injectDebugger = (cb) ->
  url = chrome.extension.getURL 'dist/batman.debug.js'

  xhr = new XMLHttpRequest()
  xhr.open('GET', url, false)
  xhr.send()

  chrome.devtools.inspectedWindow.eval xhr.responseText, cb

jQuery ->
  Batbelt.injectDebugger -> Batbelt.run()
