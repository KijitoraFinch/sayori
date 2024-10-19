import os, times

proc run*(args: seq[string]) =
    let argCount = args.len
    if argCount < 2:
        echo "Usage: sayori run <file>"
        quit(1)
    let filename = args[1]
    let tmpFilename = "sayori_tmp.nim"
    let preprocess = "sayori preproc " & filename & " > " & tmpFilename
    let stat = execShellCmd(preprocess)

    if stat != 0:
        echo "Failed to preprocess"
        quit(1)

    let nimRunCmd = "nim c -r " & tmp_filename
    echo "[sayori] Running: " & nimRunCmd
    let startTime = now()
    let nimExitStat = execShellCmd(nimRunCmd)
    let endTime = now()
    let elapsed = endTime - startTime
    echo "[sayori] Elapsed time: " & $elapsed
    
    if nimExitStat != 0:
        #removeFile(tmpFilename)
        quit(nimExitStat)
