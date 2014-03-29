assert = require 'assert'

class SylvaSocket
  constructor:(socket)->
    assert(socket,"Socket cannot be null")
    @socket = socket
    socket.on 'data',@onData
    socket.on 'close',@onClose
    socket.on 'error',@onError
    socket.on 'drain',@onDrain
    socket.on 'timeout',@onTimeout

  # Callback

  onData:(data)=>

  onClose:(has_error)=>

  onError:(error)=>

  onTimeout:()=>

  onDrain:()=>

  # Function

  write:(data,encoding,callback)=>
    @socket.write data,encoding,callback

  close:(data,encoding)=>
    @socket.end data,encoding

module.exports = SylvaSocket
