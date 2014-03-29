Sylva = {SylvaSocket} = require '../index'

log = console.log.bind console

class MySocket extends SylvaSocket
  onBind:(socket)=>
    log 'on bind'
  onData:(data)=>
    log "on data: #{data}"
  onClose:(has_error)=>
    log 'on close'
  onError:(error)=>
    log error

server = Sylva.createServer MySocket

server.listen 8888
