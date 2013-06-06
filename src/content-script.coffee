window.addEventListener 'message', (event) ->
  if event.data.for is 'batbelt'
    msg = {id: event.data.id, data: JSON.parse(event.data.data), options: event.data.options}
    chrome.extension.sendMessage(msg)

chrome.extension.onMessage.addListener (msg, sender) ->
  window.postMessage {for: 'batman.debug', id: msg.id, data: msg.data, options: msg.options}, '*'
