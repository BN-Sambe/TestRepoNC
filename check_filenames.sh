#!/bin/bash
# Check for filenames not in lowercase with hyphens

# Loop through all files that are about to be committed
for file in $(git diff --cached --name-only); do
  if [[ "$file" =~ [A-Z] ]]; then
    echo "Error: Filename '$file' contains uppercase letters."
    exit 1
  fi
  if [[ "$file" =~ [[:space:]] ]]; then
    echo "Error: Filename '$file' contains spaces."
    exit 1
  fi
done

# If no errors, exit with 0
exit 0
