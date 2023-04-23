#!/bin/bash

# cd automatically to the build folder
FOLDER=$(find $BUILD_DIR -maxdepth 1 -type d | grep -v ${BUILD_DIR}$ | head -n 1)
cd "$FOLDER"

# If there is a export file, source it
if [ -e "${FOLDER}/export" ]; then
	source "${FOLDER}/export"
fi

tmux 
