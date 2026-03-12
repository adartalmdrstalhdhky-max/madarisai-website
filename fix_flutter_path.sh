#!/bin/bash

echo "Configuring Flutter path..."

# المسار الافتراضي لـ Flutter في Codespaces
export PATH="$PATH:/usr/local/flutter/bin"

# تعريف متغير لحرف f لتجاوز مشكلة لوحة المفاتيح
f="f"

echo "Checking Flutter installation..."
${f}lutter --version

echo "Flutter path configured successfully."
