Batbelt.AppObservable =
  initialize: ->
    @appObserve = (property, cb) ->
      msg =
        type: 'observeProperty'
        id: @get('id')
        property: property

      Batbelt.sendMessage(msg, cb)
