# Start the PocketMr server, optionally start the CLI interface

pocketmr = require('./pocketmr')
repl = require('repl')

usage = '''pocketmr usage: pocketmr [arguments]

Options:
  -h, --help, --usage   print help text
  -i, --interactive     start with command line console
'''

run = ->

  help_flag = (flag for arg in process.argv when arg == '-h' or arg == '--help' or arg == '--usage')
  if help_flag.length > 0 or process.argv.length == 2
    console.log(usage)
    process.exit()

  pmr = new pocketmr.PocketMr()
  pmr.start()

  cli_flag = (arg for arg in process.argv when arg == '-i' or arg == '--interactive')
  if cli_flag.length > 0
    cli = repl.start('pocketmr> ')
    cli.context.pocketmr = pmr
    cli.context.pmr = pmr
 

exports.run = run
