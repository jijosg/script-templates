#!/usr/bin/env bash

set -eEo pipefail
help()
{
    echo "Usage: weather  [ -c | --city1 ]
                [ -d | --city2 ]
                [ -v | --verbose ]
                [ -h | --help  ]"
    exit 2
}

SHORT=c:,d:,h,v
LONG=city1:,city2:,help,verbose
OPTS=$(getopt -a -n weather --options $SHORT --longoptions $LONG -- "$@")

VALID_ARGUMENTS=$# # Returns the count of arguments that are in short or long options
echo "$OPTS"

[[ "$VALID_ARGUMENTS" -eq 0 ]] && help

eval set -- "$OPTS"

while :
do
  case "$1" in
    -c | --city1)
      city1="$2"
      shift 2
      ;;
    -d | --city2)
      city2="$2"
      shift 2
      ;;
    -h | --help)
      help
      ;;
    -v | --verbose)
      set -x
      shift
      ;;
    --)
      shift;
      break
      ;;
    *)
      echo "Unexpected option: $1"
      help
      ;;
  esac
done

if [ "$city1" ] && [ -z "$city2" ]
then
    curl -s "https://wttr.in/${city1}?0"
elif [ -z "$city1" ] && [ "$city2" ]
then
    curl -s "https://wttr.in/${city2}?0"
elif [ "$city1" ] && [ "$city2" ]
then
    diff -Naur <(curl -s "https://wttr.in/${city1}?0" ) <(curl -s "https://wttr.in/${city2}?0" )
else
    curl -s https://wttr.in
fi
