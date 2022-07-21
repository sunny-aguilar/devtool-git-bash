#!/bin/bash
# this bash script helps in running various common tasks such as pushing the repo
# to github and running the script on the command line. Some commands are combined
# for greater efficiency.

set -ex


# commit changes and push to repo
function undo()
{
    # undo commits
    git reset --hard HEAD~$n
    # push changes into repo
    git push -f origin main
}

function push_commit()
{
    #commit changes
    git commit -am 'commit msg'
    # push to github
    git push
}

function commit()
{
    # commit changes only
    git commit -am 'commit msg'
}

case $1 in
    push)
        # call function
        push_commit
        exit 0
    ;;

    commit)
        # call function
        commit
        exit 0
    ;;

    undo)
        # check if two arguments provided
        if [ "$#" -ne 2 ]; then
            echo 'You must enter exactly 2 command line arguments'
            exit 0
        fi
        # call function
        undo $2
        exit 0
    ;;

    run)
        # run Python script
        # python3 py_script.py $2 $3
        exit 0
    ;;

    runs)
        # push
        push_commit
        exit 0
    ;;

    zip)
        # zip up files
        zip -D file.py
        exit 0
    ;;

    *)
        echo 'Undefined command'
    ;;
esac

# what to run
# if [ "$1" == 'push' ]; then
#     # call function
#     push_commit
#     exit 0

# elif [ "$1" == 'commit' ]; then
#     # call function
#     commit
#     exit 0

# elif [ "$1" == 'undo' ]; then
#     # check if two arguments provided
#     if [ "$#" -ne 2 ]; then
#         echo 'You must enter exactly 2 command line arguments'
#         exit 0
#     fi
#     # call function
#     undo $2
#     exit 0

# elif [ "$1" == 'run' ]; then
#     # run Python script
#     # python3 py_script.py $2 $3
#     exit 0

# elif [ "$1" == 'runs' ]; then
#     # push
#     push_commit
#     exit 0

# elif [ "$1" == 'zip' ]; then
#     # zip up files
#     zip -D file.py
#     exit 0

# fi