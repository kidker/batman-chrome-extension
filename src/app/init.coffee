Batbelt.injectDebugger = (cb) ->
  js = ""
  for url in ['dist/batman.debug.js', 'dist/batman.shared.js']
    xhr = new XMLHttpRequest()
    xhr.open('GET', chrome.extension.getURL(url), false)
    xhr.send()
    js += xhr.responseText + ";\n"

  chrome.devtools.inspectedWindow.eval js, cb

jQuery ->
  Batbelt.injectDebugger -> debugger; Batbelt.run()
