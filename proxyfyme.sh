#! /bin/bash

# Checks for arguments passed
if [ $# -eq 2 ]; then
  HOST=$1
  PORT=$2

  printf "Set Proxy? [s] or Disable Proxy [d]\n"
  read yeah
  case $yeah in
    's')
      bash ./pron.sh $HOST $PORT
      sudo bash ./pron.sh $HOST $PORT
      sudo networking restart
      printf "PROXY ACTIVE ... DONE\n\n"
    ;;
    'd')
      ./proff.sh
      sudo ./proff.sh
      printf "PROXY DISABLED ... DONE\n\n"
    ;;
  esac
fi
