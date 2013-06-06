Batbelt.injectDebugger = (cb) ->
  chrome.devtools.network.onNavigated.addListener ->
    window.location.reload()

  js = for url in ['dist/batman.debug.js', 'dist/batman.shared.js']
    xhr = new XMLHttpRequest()
    xhr.open('GET', chrome.extension.getURL(url), false)
    xhr.send()
    xhr.responseText

  chrome.devtools.inspectedWindow.eval(js.join(';\n'), cb)

jQuery ->
  Batbelt.injectDebugger -> Batbelt.run()
