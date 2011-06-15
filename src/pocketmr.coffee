###
 
 What kind of state should the system have?

 context =
    nodes: nodes # list of known nodes
    execution': execution # the current execution

 nodes = [ node, ... ]

 node =
    execution: execution # the current execution
    databases: [ database, ... ]  # the list of databases this node has

 execution = 
    name: string # name of the execution
    path: string # path of the program itself (assume it is on the node)
    databases: [ database, ... ] # List if databases to map
    maps: [ map, ... ] # List of databases mapped
    reductions: [ reduction, ... ] # Current set of reductions
    result: reduction

 map =
    node: node
    database: database
    name: string # name of the map file

 reduction =
    name: string # name of the reduction
    node: node # node where the reduction is stored
    databases: [ database, ... ] # databases this reduction covers

  database = string # filename in the data dir

 Ok, so we have the data. What kind of events would happen?

 'databaseAdded', database, context  database added to the execution
 
 'mapComplete', map, context  a map has been completed
 'mapFailed', map, context  a map failed to complete

 'reductionComplete', reduction, context  a reduction has been completed
 'reductionFailed', reduction, context  a reduction failed to complete
###

events = require('events')

class PocketMr extends events.EventEmitter
  constructor: (@nodes=[], @databases=[]) ->
    @execution = null
    process.on('exit', this.close)

  start: ->
    console.log('pocketmr online.', 'nodes =', @nodes, 'databases =', @databases)
    this.emit('start', this)

  close: ->
    console.log('pocketmr closed')

exports.PocketMr = PocketMr
