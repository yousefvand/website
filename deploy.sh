#!/usr/bin/env bash

echo `tput setaf 2`Deploying updates to GitHub..`tput sgr0`

# Build the project.
hugo -t ananke

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg=":construction: `date -I` :alarm_clock: `date -u +%R`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..

