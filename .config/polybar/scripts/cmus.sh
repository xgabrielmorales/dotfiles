#!/bin/bash

song=$(cmus-remote -C status | grep title | cut -c 11-)
echo -n "$song"
