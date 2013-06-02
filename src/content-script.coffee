messageId = 0
responseFunctions = {}

window.addEventListener 'message', (event) ->
  if event.data.for is 'batbelt'
    sendResponse = responseFunctions[event.data.id]
    sendResponse event.data.data if sendResponse
    delete responseFunctions[event.data.id]

chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
  id = messageId++
  responseFunctions[id] = sendResponse
  window.postMessage {id: id, for: 'batman.debug', data: request}, '*'
  true
