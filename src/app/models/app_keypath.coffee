class Batbelt.AppKeypath extends Batman.Model
  @resourceName: 'app_keypath'

  @primaryKey: 'key'

  @persist Batbelt.Storage

  @mixin Batbelt.AppEventEmitter

  @encode 'key'

  constructor: ->
    super
    @set('events', new Batman.Set)
    @observe 'key', (key, oldKey) =>
      @appStopObservingEvents oldKey if oldKey

      @appStartObservingEvents key, (eventForKey) =>
        @get('events').add(eventForKey)
