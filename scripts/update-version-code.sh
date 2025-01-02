#!/bin/bash

# Path to your app's build.gradle.kts file
GRADLE_FILE="app/build.gradle.kts"

# Extract the current version code using regex (for .kts)
CURRENT_VERSION_CODE=$(grep -oP 'versionCode\s*=\s*\K\d+' $GRADLE_FILE)

# If the versionCode is not found, default to 1
if [ -z "$CURRENT_VERSION_CODE" ]; then
  CURRENT_VERSION_CODE=1
fi

# Increment the version code
NEW_VERSION_CODE=$((CURRENT_VERSION_CODE + 1))

# Update the version code in the build.gradle.kts file
sed -i "s/versionCode\s*=\s*$CURRENT_VERSION_CODE/versionCode = $NEW_VERSION_CODE/" $GRADLE_FILE

echo "Updated versionCode to $NEW_VERSION_CODE"
