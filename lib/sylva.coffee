net = require 'net'
SylvaSocket = require './sylva_socket'

module.exports =
  createServer:(options = {},clazz)->
    unless clazz?
      clazz = options
      options = null
    server = net.createServer options,(s)->
      ss = new clazz s
    server
