vows = require 'vows'
assert = require 'assert'
events = require 'events'
DataSet = require('../lib/dataset').DataSet

vows
  .describe('dataset')
  .addBatch

    'when created':
      topic: -> new DataSet('derp')

      'should have a path': (topic) ->
        assert.equal topic.path, 'derp'
       
  .export(module)
