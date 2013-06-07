class Batbelt.PropertiesView extends Batman.View
  @option 'properties'

  source: 'properties'

  @accessor 'propertyKeys', ->
    @get('properties')?.keys()

  @accessor 'isObject', ->
    new Batman.Accessible (key) =>
      typeof @get("properties.#{key}") is 'object'

  expandObject: (key, node, event) ->
    return if event.target != node

    if node.childNodes.length > 1
      return node.innerHTML = '[Object]'

    div = document.createElement('div')
    div.setAttribute('data-view-properties', 'value')
    node.appendChild(div)

    context = Batman value: new Batman.Hash(@_buildHash(@get("properties.#{key}")))
    new Batbelt.PropertiesView({node: div, context, parentView: this})

  _buildHash: (value) ->
    switch Object.prototype.toString.call(value)
      when '[object Function]'
        return {0: '<Function>'}

      when '[object Array]'
        id = 0
        hash = {}
        value.forEach (item) -> hash[id++] = item
        return hash

      when '[object Object]'
        return value
