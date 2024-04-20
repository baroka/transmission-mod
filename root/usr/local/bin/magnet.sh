#!/bin/sh
# Script for add magnet files to transmission
# Executed after adding new magnet files in folder

# Files
watchDir="/watch"

inotifywait -m -e create,moved_to $watchDir --includei "\.magnet$" --format %w%f | while read line; do
  echo "add magnet file.. ${line}"
  # Add file to transmission
  magnet=`head -1 "$line"`
  transmission-remote --add "$magnet"  	    	
  # Remove file
  rm "${line}"
done