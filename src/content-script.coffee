window.addEventListener 'message', (event) ->
  if event.data.for is 'batbelt'
    chrome.extension.sendMessage({id: event.data.id, data: JSON.parse(event.data.data)})

chrome.extension.onMessage.addListener (msg, sender) ->
  window.postMessage {for: 'batman.debug', id: msg.id, data: msg.data}, '*'
