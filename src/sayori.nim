# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import system, os
import preproc
import initcontest
import runner

when isMainModule:
  let args = paramCount()
  if args < 1:
    echo "Usage: sayori <command> [args]"
    quit(1)

  let command = paramStr(1)
  case command
  of "init", "ini" :
    initContest(args)
  
  of "preproc", "pp":
    preproc(args)
  
  of "run":
    run(args)
  
  else:
    echo "Unknown command: " & command
    quit(1)

