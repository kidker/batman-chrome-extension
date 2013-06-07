// Generated by CoffeeScript 1.6.3
Batbelt.AppEventEmitter = {
  initialize: function() {
    this.appStartObservingEvents = function(keypath, cb) {
      var msg;
      msg = {
        type: 'startObservingEvents',
        keypath: keypath
      };
      return Batbelt.sendMessage(msg, cb);
    };
    return this.appStopObservingEvents = function(keypath, cb) {
      var msg;
      msg = {
        type: 'stopObservingEvents',
        keypath: keypath
      };
      return Batbelt.sendMessage(msg, cb);
    };
  }
};