class SylvaSocket
  constructor:(socket)->
    @socket = socket
    socket.on 'data',@onData
    socket.on 'close',@onClose
    socket.on 'error',@onError
    socket.on 'drain',@onDrain
    socket.on 'timeout',@onTimeout
    socket.on 'end',@onEnd

    @write = @socket.write.bind @socket
    @end = @socket.end.bind @socket

    @onBind(@socket)

  # Callback

  onEnd:()=>

  onBind:(socket)=>

  onData:(data)=>

  onClose:(has_error)=>

  onError:(error)=>

  onTimeout:()=>

  onDrain:()=>

module.exports = SylvaSocket
