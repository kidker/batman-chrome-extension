class BatmanDebug
  init: ->
    @messageListener()

  messageListener: ->
    window.addEventListener 'message', (event) =>
      if event.data.for is 'batman.debug'
        @handleMessage event.data.data, (res) ->
          window.postMessage {id: event.data.id, from: 'batman.debug', data: res}, '*'

  handleMessage: (msg, cb) ->
    switch msg.type
      when 'ping'
        cb type: 'pong'
      else
        console.log 'Unknown message', msg

if window.Batman?.currentApp
  app = window.Batman.currentApp
  app.debug = new BatmanDebug()
  app.debug.init()
