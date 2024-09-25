import os, times

proc run*(args: int) =
    if args < 2:
        echo "Usage: sayori run <file>"
        quit(1)
    let filename = paramStr(2)
    let tmpFilename = "sayori_tmp.nim"
    let preprocess = "sayori preproc " & filename & " > " & tmpFilename
    let stat = execShellCmd(preprocess)

    if stat != 0:
        echo "Failed to preprocess"
        quit(1)

    let nimRunCmd = "nim c -r " & tmp_filename
    echo "Running: " & nimRunCmd
    let nimExitStat = execShellCmd(nimRunCmd)
    
    if nimExitStat != 0:
        #removeFile(tmpFilename)
        quit(nimExitStat)

