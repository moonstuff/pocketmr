fs = require('fs')

createDirectories = (dirs, success, failure) ->
    createDirectoriesTail(null, dirs, success, failure)

createDirectoriesTail = (err, dirs, success, failure) ->
    if dirs.length == 0
      return success()

    if err != null and err.code != 'EEXIST'
      return failure("Could not create directory: #{err.message}")
    
    dir = dirs.shift()
    fs.mkdir(dir, 0777, (e) => createDirectoriesTail(e, dirs, success, failure))

exports.createDirectories = createDirectories

