Batbelt.AppEventEmitter =
  initialize: ->
    @appStartObservingEvents = (keypath, cb) ->
      msg =
        type: 'startObservingEvents'
        keypath: keypath

      Batbelt.sendMessage(msg, cb)

    @appStopObservingEvents = (keypath, cb) ->
      msg =
        type: 'stopObservingEvents'
        keypath: keypath

      Batbelt.sendMessage(msg, cb)