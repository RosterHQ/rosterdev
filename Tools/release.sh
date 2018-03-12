#!/bin/bash

# Usage: release <tag>
#   E.g., release 13.0.0

RELEASE_TAG=$1
git add -A
git commit -m "Version $RELEASE_TAG"
git tag -a "$RELEASE_TAG" -m "version $RELEASE_TAG"
git push
git push --tags
