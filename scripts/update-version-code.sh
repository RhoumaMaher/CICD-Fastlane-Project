#!/bin/bash

# File to update
VERSION_FILE="version.properties"

# Ensure the file exists
if [ ! -f "$VERSION_FILE" ]; then
  echo "versionCode=1" > "$VERSION_FILE"
  echo "versionName=1.0" >> "$VERSION_FILE"
fi

# Fetch the latest version of the file from the repo
git pull origin $(git rev-parse --abbrev-ref HEAD)

# Read current values
VERSION_CODE=$(grep "versionCode=" "$VERSION_FILE" | cut -d'=' -f2)
VERSION_NAME=$(grep "versionName=" "$VERSION_FILE" | cut -d'=' -f2)

# Increment versionCode
NEW_VERSION_CODE=$((VERSION_CODE + 1))

# Update versionName (optional: adjust logic as needed)
NEW_VERSION_NAME="$NEW_VERSION_CODE.0"

# Write new values back to the file
echo "versionCode=$NEW_VERSION_CODE" > "$VERSION_FILE"
echo "versionName=$NEW_VERSION_NAME" >> "$VERSION_FILE"

echo "Updated versionCode to $NEW_VERSION_CODE and versionName to $NEW_VERSION_NAME"

# Commit and push changes
git config --global user.name "CircleCI Bot"
git config --global user.email "ci-bot@example.com"

git add "$VERSION_FILE"
git commit -m "Incremented version to $NEW_VERSION_CODE ($NEW_VERSION_NAME)"
git push origin $(git rev-parse --abbrev-ref HEAD)
