net = require 'net'
SylvaSocket = require './sylva_socket'

module.exports =
  start:(port,clazz)->
    server = net.createServer (s)->
      s.setEncoding 'utf8'
      s.setTimeout 0
      s.setKeepAlive true,15000
      ss = new clazz s
    server.listen port
    server
