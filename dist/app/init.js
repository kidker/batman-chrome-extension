// Generated by CoffeeScript 1.6.3
Batbelt.injectDebugger = function(cb) {
  var url, xhr;
  url = chrome.extension.getURL('dist/batman.debug.js');
  xhr = new XMLHttpRequest();
  xhr.open('GET', url, false);
  xhr.send();
  return chrome.devtools.inspectedWindow["eval"](xhr.responseText, cb);
};

jQuery(function() {
  return Batbelt.injectDebugger(function() {
    debugger;
    return Batbelt.run();
  });
});
