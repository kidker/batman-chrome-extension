messageId = 0
responseFunctions = {}

window.addEventListener 'message', (event) ->
  console.log 'content-script', event, responseFunctions
  if event.data.from is 'batman.debug'
    sendResponse = responseFunctions[event.data.id]
    sendResponse event.data.data if sendResponse
    delete responseFunctions[event.data.id]

chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
  id = messageId++
  responseFunctions[id] = sendResponse
  window.postMessage {id: id, for: 'batman.debug', data: request}, '*'
  true
