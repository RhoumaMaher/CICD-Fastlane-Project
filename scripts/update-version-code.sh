#!/bin/bash

# Path to your app's build.gradle file
GRADLE_FILE="app/build.gradle"

# Extract the current version code
CURRENT_VERSION_CODE=$(grep "versionCode" $GRADLE_FILE | awk '{print $2}')

# Increment the version code
NEW_VERSION_CODE=$((CURRENT_VERSION_CODE + 1))

# Update the version code in the build.gradle file
sed -i "s/versionCode $CURRENT_VERSION_CODE/versionCode $NEW_VERSION_CODE/" $GRADLE_FILE

echo "Updated versionCode to $NEW_VERSION_CODE"
