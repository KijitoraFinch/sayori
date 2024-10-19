import os, strutils

proc preproc*(args: seq[string]) = 
    let argCount = args.len
    if argCount < 2:
      echo "Usage: sayori preproc <file>"
      quit(1)
    let filename = args[1]
    
    # open file
    block:

      var f = open(filename, FileMode.fmRead)
      if f == nil:
        echo "Failed to open file: " & filename
        quit(1)
      defer: 
        f.close()
      
      while f.endOfFile == false:
        let l = f.readLine()
        let splitLine = l.split(" ")
        if  splitLine.len >= 2 and splitLine[0] == "include":
          
            block:
              let required = open(splitLine[1], FileMode.fmRead)
              defer:
                required.close()
              while required.endOfFile == false:
                echo required.readLine()

        else:
          echo l
  
