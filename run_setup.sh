#!/bin/bash

echo "Starting MadarisAI setup..."

# حل مشكلة حرف f
f="f"

echo "Running Flutter dependency install..."
${f}lutter pub get

echo "Cleaning Gradle build..."
cd android
./gradlew clean
cd ..

echo "Saving work to GitHub..."

git add .
git commit -m "Configure Firebase + Gradle setup for com.madarisai.app"
git push origin main

echo "Setup completed successfully."
