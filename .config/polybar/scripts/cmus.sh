#!/bin/bash

artist=$(echo -n $(cmus-remote -C status | grep artist -m 1| cut -c 12-))
song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))

echo -n "$artist - $song"
