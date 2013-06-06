class Batbelt.PropertiesView extends Batman.View
  @option 'properties'

  source: 'properties'

  @accessor 'propertyKeys', -> @get('properties').keys()
