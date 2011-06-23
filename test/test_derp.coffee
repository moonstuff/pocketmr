vows = require 'vows'
assert = require 'assert'

vows
  .describe('Derp')
  .addBatch

    'when derping':
      topic: -> 'derp'
        
      'it should really derp': (topic) ->
        assert.equal topic, 'derp'

      'it should never herp': (topic) ->
        assert.notEqual topic, 'herp'

  .export(module)
