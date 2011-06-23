{exec, spawn} = require 'child_process'

handleError = (err) ->
  if err
    console.log "\n\033[1;36m=>\033[1;37m Remember that you need: coffee-script@0.9.4 and vows@0.5.2\033[0;37m\n"
    console.log err.stack

print = (data) -> console.log data.toString().trim()

##

name = 'pocketmr'

option '-s', '--spec', 'Use Vows spec mode'

task 'build', "Compile #{name} Coffeescript source to Javascript", ->
  exec "mkdir -p lib && coffee -c -o lib src", handleError

task 'clean', 'Remove generated Javascripts', ->
  exec 'rm -fr lib', handleError

task 'test', 'Test the app', (options) ->
  # invoke 'build'

  args = [
    'test/test_derp.coffee', # Pretty useless, but if it fails then something is very wrong.
    'test/test_pocketmr.coffee',
    'test/test_worker.coffee',
    'test/test_dataset.coffee',
  ]
  args.unshift '--spec' if options.spec

  vows = spawn 'vows', args
  vows.stdout.on 'data', print
  vows.stderr.on 'data', print

task 'dev', 'Continuous compilation', ->
  coffee = spawn 'coffee', '-wc --bare -o lib src'.split(' ')

  coffee.stdout.on 'data', print
  coffee.stderr.on 'data', print
