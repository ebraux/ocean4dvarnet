#!/bin/bash
set -e

VERSION=$(python -c "
import tomllib
with open('pyproject.toml', 'rb') as f:
    print(tomllib.load(f)['project']['version'])
")
echo "version=$VERSION" >> "$GITHUB_OUTPUT"
echo "Extracted version: $VERSION"
# Check if the version is a valid semantic version
if [[ ! $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Version '$VERSION' is not a valid semantic version." >&2
    exit 1
fi

