#!/bin/bash

VERSION_FILE="version.properties"

# Read current version from the file
if [ ! -f $VERSION_FILE ]; then
    echo "versionCode=1" > $VERSION_FILE
    echo "versionName=1.0" >> $VERSION_FILE
fi

VERSION_CODE=$(grep "versionCode" $VERSION_FILE | cut -d'=' -f2)
VERSION_NAME=$(grep "versionName" $VERSION_FILE | cut -d'=' -f2)

# Increment versionCode
NEW_VERSION_CODE=$((VERSION_CODE + 1))

# Optionally increment versionName (update major/minor as needed)
NEW_VERSION_NAME=$(echo $VERSION_NAME | awk -F. '{print $1 "." $2+1}')

# Write updated values back to the file
echo "versionCode=$NEW_VERSION_CODE" > $VERSION_FILE
echo "versionName=$NEW_VERSION_NAME" >> $VERSION_FILE

# Export them for CI usage
echo "export VERSION_CODE=$NEW_VERSION_CODE" >> $BASH_ENV
echo "export VERSION_NAME=$NEW_VERSION_NAME" >> $BASH_ENV

echo "Updated versionCode to $NEW_VERSION_CODE"
echo "Updated versionName to $NEW_VERSION_NAME"
