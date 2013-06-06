window.$prettify = (obj, stack = []) ->
  if obj in stack
    return "Circular reference"
  stack.push(obj)

  if not obj
    pretty = obj

  else if obj instanceof Array
    pretty = []
    for value in obj
      pretty.push $prettify(value, stack)

  else if obj instanceof Batman.SimpleHash or obj instanceof Batman.Hash
    pretty = {}
    obj.forEach (key, value) ->
      pretty[key] = $prettify(value, stack)

  else if obj instanceof Batman.SimpleSet or obj instanceof Batman.Set or obj.forEach
    pretty = []
    obj.forEach (value) ->
      pretty.push $prettify(value, stack)

  else if obj instanceof Batman.Property
    pretty = $prettify(obj.getValue(), stack)

  else if obj instanceof Batman.Model
    pretty = obj.toJSON()

  else if obj instanceof Batman.Object
    pretty = {}
    pretty['properties'] = $prettify(obj._batman.properties, stack)

  else if obj instanceof Batman.RenderContext
    # don't deal with this right now
    pretty = 'Batman.RenderContext'

  else if obj.constructor && obj.call && obj.apply
    # if we have the prototype for a model
    if obj.get and obj.storageKey and loaded = obj.get('loaded')
      pretty = $prettify(loaded, stack)
    else
      pretty = "[object Function]"

  else if obj instanceof Object
    pretty = {}
    for own key, val of obj
      pretty[key] = $prettify(val, stack)

  else
    pretty = obj

  stack.pop()
  return pretty

BatmanDebug.prettify = window.$prettify if BatmanDebug?
Batbelt.prettify = window.$prettify if Batbelt?
