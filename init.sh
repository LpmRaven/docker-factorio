#!/bin/bash

if [ -e $SAVEFILE ]
then
  echo "LOAD SAVE FILE"
  /opt/factorio/bin/x64/factorio --start-server-load-latest --server-settings $SERVERSETTINGS
else
  echo "NO SAVE FILE CREATING SAVE FILE"
  /opt/factorio/bin/x64/factorio --create $SAVEFILE --map-gen-settings $MAPSETTINGS
  /opt/factorio/bin/x64/factorio --start-server $SAVEFILE --server-settings $SERVERSETTINGS
fi
echo "starting server"
