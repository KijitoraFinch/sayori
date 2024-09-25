import os

proc initContest*(args: int) =
    if args < 2:
      echo "Usage: sayori init <contest_name> [template_dir](optional. default: $SAYORI_TEMPLATE)"
      quit(1)
    let contest_name = paramStr(2)
    let contest_dir = contest_name
    if dirExists(contest_dir):
      echo "Directory already exists: " & contest_dir
      quit(1)
    createDir(contest_dir)
    

    if args == 2:
        copyDir(os.getEnv("SAYORI_TEMPLATE"), contest_dir)
        echo "Created contest directory: " & contest_dir
    elif args == 3:
        let template_dir = paramStr(3)
        copyDir(template_dir, contest_dir)
        echo "Created contest directory: " & contest_dir
    else:
        echo "Usage: sayori init <contest_name> [template_dir](optional. default: $SAYORI_TEMPLATE)"
        quit(1)

