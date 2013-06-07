Batbelt.AppObservable =
  initialize: ->
    @appObserve = (property, cb) ->
      msg =
        type: 'observeLoadedProperty'
        id: @get(@constructor.primaryKey)
        property: property

      Batbelt.sendMessage(msg, cb)

    @observeProperties = ->
      @observe 'properties', (properties) =>
        properties.forEach (key, value) =>
          @appObserve key, (newValue) => @set("properties.#{key}", newValue)
