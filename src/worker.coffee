# The worker, a logical unit that can execute jobs.
#
# This worker has a workspace, can accept parts of a job and coordinate moving
# data and code to and from the workspace, as well as executing the job itself.
events = require('events')

class Worker extends events.EventEmitter

  constructor: (@uuid) ->
    @workspace = "#{process.cwd()}/workers/#{@uuid}"

exports.Worker = Worker
