class Batbelt.Panel
  init: ->
    chrome.devtools.panels.create 'Batman', 'img/logo.png', 'views/panel.html', ->
