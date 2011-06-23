vows = require 'vows'
assert = require 'assert'
events = require 'events'
PocketMr = require('../lib/pocketmr').PocketMr

vows
  .describe('pocketmr')
  .addBatch

    'when created':
      topic: -> new PocketMr()
        
      'should have no nodes': (topic) ->
        assert.isEmpty topic.nodes

      'should have no datasets': (topic) ->
        assert.isEmpty topic.datasets

  .addBatch

    'when configured':
      topic: ->
        pocketmr = new PocketMr()
        pocketmr.on('configure', this.callback)
        pocketmr.configure()
        undefined

      'should have a workspace in #{cwd}/pocketmr': (err, pocketmr) ->
        assert.isNull(err)
        assert.equal(pocketmr.workspacePath, "#{process.cwd()}/pocketmr")

  .addBatch

    'when started':
      topic: ->
        pocketmr = new PocketMr()
        pocketmr.on('start', this.callback)
        pocketmr.start()
        undefined

      'should emit a start event': (err, pocketmr) ->
        assert.isNull(err)
        assert.isObject(pocketmr)

    'when closed':
      topic: ->
        pocketmr = new PocketMr()
        pocketmr.on('close', this.callback)
        pocketmr.close()
        undefined

      'should emit a close event': (err, pocketmr) ->
        assert.isNull(err)
        assert.isObject(pocketmr)

  .export(module)
