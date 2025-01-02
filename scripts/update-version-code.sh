#!/bin/bash

# Path to your app's build.gradle.kts file
GRADLE_FILE="app/build.gradle.kts"

# Extract the current versionCode using regex
CURRENT_VERSION_CODE=$(grep -oP 'versionCode\s*=\s*\K\d+' $GRADLE_FILE)

# Extract the current versionName using regex
CURRENT_VERSION_NAME=$(grep -oP 'versionName\s*=\s*"\K[^\"]+' $GRADLE_FILE)

# If versionCode is not found, default to 1
if [ -z "$CURRENT_VERSION_CODE" ]; then
  CURRENT_VERSION_CODE=1
fi

# If versionName is not found, default to "1.0"
if [ -z "$CURRENT_VERSION_NAME" ]; then
  CURRENT_VERSION_NAME="1.0"
fi

# Increment the versionCode
NEW_VERSION_CODE=$((CURRENT_VERSION_CODE + 1))

# Increment the versionName (e.g., from "1.0" to "1.1")
# Assuming versionName is in "X.Y" format
NEW_VERSION_NAME=$(echo "$CURRENT_VERSION_NAME" | awk -F. '{print $1"."$2 + 1}')

# Update the versionCode in the build.gradle.kts file
sed -i "s/versionCode\s*=\s*$CURRENT_VERSION_CODE/versionCode = $NEW_VERSION_CODE/" $GRADLE_FILE

# Update the versionName in the build.gradle.kts file
sed -i "s/versionName\s*=\s*\"$CURRENT_VERSION_NAME\"/versionName = \"$NEW_VERSION_NAME\"/" $GRADLE_FILE

echo "Updated versionCode to $NEW_VERSION_CODE"
echo "Updated versionName to $NEW_VERSION_NAME"
