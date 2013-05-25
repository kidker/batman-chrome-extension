class Batbelt.DashboardController extends Batman.Controller
  routingKey: 'dashboard'

  index: (params) ->
    console.log 'dashboard index'
    @showBlock = true
    @hideBlock = false
