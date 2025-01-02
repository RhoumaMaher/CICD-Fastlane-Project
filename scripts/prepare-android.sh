#!/bin/bash
set -e  # Exit on error

# Ensure Gradle wrapper is executable
chmod +x ./gradlew

# Clean the project
./gradlew clean

# Install Ruby gems
bundle install

# Install Fastlane plugins
bundle exec fastlane install_plugins
