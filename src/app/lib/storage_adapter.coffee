class Batbelt.Storage extends Batman.StorageAdapter
  constructor: ->
    return null unless Batbelt.sendMessage

  callDebugger: (key, options, cb) ->
    msg =
      type: 'storageAdapter'
      key: key
      options: options

    Batbelt.sendMessage(msg, cb)

  @::before 'all', @skipIfError (env, next) ->
    env.key = env.subject.get('resourceName')
    next()

  @::before 'read', 'create', 'update', 'destroy', @skipIfError (env, next) ->
    env.options ||= {}
    env.options.id = env.subject.get('id')
    next()

  @::after 'read', @skipIfError (env, next) ->
    env.subject._withoutDirtyTrakcing -> @fromJSON env.recordAttributes
    next()

  @::after 'read', 'create', 'update', 'destroy', @skipIfError (env, next) ->
    env.result = env.subject
    next()

  @::after 'readAll', @skipIfError (env, next) ->
    env.result = env.records = @getRecordsFromData(env.recordsAttributes, env.subject)
    next()

  read: @skipIfError (env, next) ->
    @callDebugger "read::#{env.key}", env.options, (result) =>
      env.recordAttributes = result
      env.error = new @constructor.NotFoundError() unless env.recordAttributes
      next()

  create: @skipIfError (env, next) ->
    @callDebugger "create::#{env.key}", env.options, (result) =>
      next()

  update: @skipIfError (env, next) ->
    @callDebugger "update::#{env.key}", env.options, (result) =>
      next()

  destroy: @skipIfError (env, next) ->
    @callDebugger "destroy::#{env.key}", env.options, (result) ->
      next()

  readAll: @skipIfError (env, next) ->
    @callDebugger "readAll::#{env.key}", env.options, (result) =>
      env.recordsAttributes = result
      next()
