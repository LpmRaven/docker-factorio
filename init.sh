#!/bin/bash

if [ $SAVEFILE ]; 
then
echo "LOAD SAVE FILE"
else
  echo "NO SAVE FILE CREATING SAVE FILE"
  /opt/factorio/bin/x64/factorio --create $SAVEFILE --map-gen-settings $MAPSETTINGS
fi
echo "starting server"
/opt/factorio/bin/x64/factorio --start-server $SAVEFILE --server-settings $SERVERSETTINGS
