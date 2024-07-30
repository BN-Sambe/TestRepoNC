#!/bin/bash

# Define regex patterns
FILENAME_PATTERN="^[a-z0-9\-]+\.pbix$"
FOLDERNAME_PATTERN="^[a-z]+([A-Z][a-z]+)*$"

# Check each file and folder in the repository
for FILE in $(git ls-files); do
    BASENAME=$(basename "$FILE")
    DIRNAME=$(dirname "$FILE")
    if [[ $BASENAME == *.pbix ]]; then
        if ! [[ $BASENAME =~ $FILENAME_PATTERN ]]; then
            echo "Error: PBIX file $FILE does not match the naming convention."
            exit 1
        fi
    fi
    if ! [[ $DIRNAME =~ $FOLDERNAME_PATTERN ]]; then
        echo "Error: Folder $DIRNAME does not match the naming convention."
        exit 1
    fi
done