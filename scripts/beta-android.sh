#!/bin/bash
set -e  # Exit on error

# Run Fastlane beta deployment
bundle exec fastlane beta_android
