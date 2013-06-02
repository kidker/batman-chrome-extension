Batbelt.AppObservable =
  appObserve: (property, cb) =>
    msg =
      type: 'observeProperty'
      id: @get('id')
      property: property

    Batbelt.sendMessage(msg, cb)
