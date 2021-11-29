#!/bin/bash

PING=$(ping 8.8.8.8 -c 1 | tail -1 | cut -d "/" -f5 | cut -d "." -f1)

[[ "$PING" == "" ]] && echo " " || echo " $PING""ms"
