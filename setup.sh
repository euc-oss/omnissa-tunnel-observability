#! /bin/bash

if [ $# -ne 1 ]; then
   echo "Run setup.sh with:
     tunall: if all tunnel observability components need to run
     clean: clean up all containers"
   exit 1
fi
case "$1" in
  "tunall")
       docker compose -f docker-compose.yml up --build --force-recreate -d; shift;;
  "clean")
       docker compose down --remove-orphans; shift;;
esac
