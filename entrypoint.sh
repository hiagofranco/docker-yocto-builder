#!/bin/bash

# cd automatically to the build folder
FOLDER=$(find $BUILD_DIR -maxdepth 1 -type d | grep -v ${BUILD_DIR}$ | head -n 1)
cd "$FOLDER"

# If there is a export file, source it
if [ -e "${FOLDER}/export" ]; then
	source "${FOLDER}/export"
fi

# Copy bash history, if it exists from previous sessions
if [ -e "${FOLDER}/.bash_history" ]; then
	cp ${FOLDER}/.bash_history ~/
fi

# Call tmux terminal
tmux

# Save the new history from last session
history -w
cp ~/.bash_history $FOLDER

exit 0
