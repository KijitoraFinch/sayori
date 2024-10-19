import os

proc initContest*(args: seq[string]) =
    let argCount = args.len
    if argCount < 2:
      echo "Usage: sayori init <contest_name> [template_dir](optional. default: $SAYORI_TEMPLATE)"
      quit(1)
    let contest_name = args[1]
    let contest_dir = contest_name
    if dirExists(contest_dir):
      echo "Directory already exists: " & contest_dir
      quit(1)
    createDir(contest_dir)
    

    if argCount == 1:
        copyDir(os.getEnv("SAYORI_TEMPLATE"), contest_dir)
        echo "Created contest directory: " & contest_dir
    elif argCount == 2:
        let template_dir = args[2]
        copyDir(template_dir, contest_dir)
        echo "Created contest directory: " & contest_dir
    else:
        echo "Usage: sayori init <contest_name> [template_dir](optional. default: $SAYORI_TEMPLATE)"
        quit(1)

