import os, strutils

proc preproc*(args: int) = 

    if args < 2:
      echo "Usage: sayori preproc <file>"
      quit(1)
    let filename = paramStr(2)
    
    # open file
    block:

      let includes = os.getEnv("SAYORI_INCLUDES").split(",")

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
          
          if includes.contains(splitLine[1]):
            block:
              let required = open(splitLine[1], FileMode.fmRead)
              defer:
                required.close()
              while required.endOfFile == false:
                echo required.readLine()

        else:
          echo l
  
