Sylva v0.0.2
=====

Sylva is a simple module easy to use for building a socket server.

## Design Pattern

** `CoffeeScript` is strongly suggested while using this module **

`Sylva` turn the `callback` parameter of `net.createServer([options],callback)` into a "class".

By subclassing `SylvaSocket` "class", socket events will turn into serials of functions which can be overriden.

You can benifit this design pattern by storing some variables in your subclass.

## Usage

`error`,`data`,`drain`,`end`,`close`,`timeout` events of `net.Socket` are converted into functions named with a leading `on` and next word first character uppercased in `SylvaSocket`.

default implements does nothing, you can override them without call `super`.

`onBind(socket)` will called after instance of `SylvaSocket` or its subclass is initialized.

`write`,`end` function is also proxied for convenience.

## Example

```CoffeeScript

Sylva = {SylvaSocket} = require 'sylva'

class MySocket extends SylvaSocket

  @onBind:(socket)=>
    socket.setKeepAlive true,15000
    socket.setTimeout 0
    socket.setEncoding 'utf8'

  @onData:(data)=>
    console.log data

  @onClose:(has_error)=>
    console.log 'Connection Closed'

server = Sylva.createServer MySocket
server.listen 8888

```

see also `test/index.coffee`
