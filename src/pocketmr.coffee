events = require('events')
fs = require('./util/fsutils')

class PocketMr extends events.EventEmitter
  constructor: (@nodes=[], @datasets=[], @execution=null) ->
    @workspacePath = "#{process.cwd()}/pocketmr"
    @datasetsPath = "#{@workspacePath}/datasets"
    @jobsPath = "#{@workspacePath}/jobs"
    @workersPath = "#{@workspacePath}/workers"
 
  start: ->
    this.emit('start', null, this)

  close: ->
    this.emit('close', null, this)

  configure: ->
   fs.createDirectories(
      [@workspacePath, @datasetsPath, @jobsPath, @workersPath],
      => this.emit('configure', null, this),
      (err) => this.emit('configure', err, this)
    )

exports.PocketMr = PocketMr
