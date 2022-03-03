#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

usage() {                                 # Function: Print a help message.
  echo "Usage: $0 [-n NAME] [-h HELP]" 1>&2 
}

exit_abnormal() {                         # Function: Exit with error.
  usage
  exit 1
}

[[ "$#" -eq 0 ]] && exit_abnormal		# If no arguments, exit abnormally.

while getopts "n:h" options; do         # Loop: Get the next option;
                                          # use silent error checking;
                                          # options n and t take arguments.
  case "${options}" in                    # 
    n)                                    # If the option is n,
      NAME=${OPTARG}                      # set $NAME to specified value.
      ;;
    h) usage							  # If the option is h,
	  exit 0							  # print the help message and exit normally.
	  ;;  
    :)                                    # If expected argument omitted:
      echo "Error: -${OPTARG} requires an argument."
      exit_abnormal                       # Exit abnormally.
      ;;
    *)                                    # If unknown (any other) option:
      exit_abnormal                       # Exit abnormally.
      ;;
  esac
done

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

arg1="${1:-}"
echo $__dir $__file $__base $__root $arg1

# Define arrays
arr=("one" "two" "three")
# Print all the elements in the array
for i in ${arr[@]}
do
	echo $i
done

# Print all the elements in the array
for i in ${arr[*]}
do
	echo $i
done
