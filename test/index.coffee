Sylva = {SylvaSocket} = require '../index'

log = console.log.bind console

class MySocket extends SylvaSocket
  onBind:(socket)=>
    socket.setEncoding 'utf8'
    log 'on bind'
  onData:(data)=>
    log "on data: #{data}"
    unless -1 is data.indexOf 'close'
      @end "Bye\n"
    else
      @write "data received\n"
  onClose:(has_error)=>
    log 'on close'
  onError:(error)=>
    log error

server = Sylva.createServer MySocket

server.listen 8888,()->
  console.log 'Server is listening at 8888, use `nc 127.0.0.1 8888` to test'
