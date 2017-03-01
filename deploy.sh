#!/bin/bash

ENV_FILE=".env" && test -f $ENV_FILE && source $ENV_FILE

function heroku_web()
{
  echo -e "Deploy Frontend to Heroku"
  git subtree push --prefix web heroku_web master
  return 0
}

function heroku_api()
{
  echo -e "Deploy Backend to Heroku"
  git subtree push --prefix server heroku_api master
  return 0
}

function heroku ()
{
  echo "Deploying to Heroku"
  if [ "x${MODULE}" == "xweb" ];
  then
    heroku_web
  elif [ "x${MODULE}" == "xapi" ];
  then
    heroku_api
  else
    heroku_api
    heroku_web
  fi
  exit
}

function pi ()
{
  echo -e "Deploying to pi"
  (cd web ; npm run build)
  rsync -av --del web/build/* pi:/var/www/html
  exit
}

function usage {
  echo -e "Usage: $0 --taget [TARGET]\n"
  exit
}

while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
      -t|--target)
        TARGET="$2"
        shift
        ;;
      -m|--module)
        MODULE="$2"
        shift
        ;;
      -h|--help|-help|--h)
        usage
        exit
      ;;
      *)
        echo "unknown parameter $key"
        usage
        exit 1
        ;;
    esac
    # Shift after checking all the cases to get the next option
    shift
done

case "${TARGET}" in
  "pi")
    pi
    ;;
  "heroku")
    heroku
    ;;
esac

echo "${TARGET}"
