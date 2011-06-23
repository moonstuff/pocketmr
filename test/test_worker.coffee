vows = require 'vows'
assert = require 'assert'
events = require 'events'
PocketMr = require('../lib/pocketmr').PocketMr
Worker = require('../lib/worker').Worker

vows
  .describe('worker')
  .addBatch

    'when created':
      topic: -> new Worker('derp')

      'should have a uuid': (topic) ->
        assert.equal topic.uuid, 'derp'

      'should have a workspace of #{cwd}/workers/#{uuid}': (topic) ->
        assert.equal topic.workspace, "#{process.cwd()}/workers/#{topic.uuid}"
       
  .export(module)
