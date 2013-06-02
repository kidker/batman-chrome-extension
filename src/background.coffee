panelId = null

chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
  if request.tabId
    panelId = sender.tab.id
    chrome.tabs.sendMessage request.tabId, request.data, (response) ->
      sendResponse response
  else if panelId
    chrome.tabs.sendMessage panelId, request.data, (response) ->
      sendResponse response

  true
