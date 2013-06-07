class Batbelt.AppKeypath extends Batman.Model
  @resourceName: 'app_keypath'

  @primaryKey: 'key'

  @persist Batbelt.Storage

  @mixin Batbelt.AppEventEmitter

  @encode 'key'

  constructor: ->
    super
    @set('events', new Batman.Set)
    @set('appErrors', new Batman.Set)

    @observe 'key', (key, oldKey) =>
      @get('events').clear()
      @get('appErrors').clear()
      @appStopObservingEvents oldKey if oldKey

      @appStartObservingEvents key, (eventForKey) =>
        if eventForKey.error
          @get('appErrors').add(eventForKey)
        else
          @get('events').add(eventForKey)
