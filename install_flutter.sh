#!/bin/bash

# Exit script immediately if any command fails
set -e 

echo "Starting Flutter and Android SDK installation..."

# 1. Install prerequisites
echo "Installing prerequisites..."
sudo apt update
sudo apt install -y curl git unzip xz-utils openjdk-17-jdk

# 2. Download and Extract Flutter
echo "Downloading Flutter SDK..."
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.2-stable.tar.xz

echo "Extracting Flutter to /opt..."
sudo tar xf flutter_linux_3.41.2-stable.tar.xz -C /opt
rm flutter_linux_3.41.2-stable.tar.xz

# 3. Download and Extract Android SDK
echo "Downloading Android Command Line Tools..."
mkdir -p ~/Android/cmdline-tools
curl -O https://dl.google.com/android/repository/commandlinetools-linux-14742923_latest.zip

echo "Extracting Android SDK..."
unzip -q commandlinetools-linux-14742923_latest.zip
# Directly format into the 'latest' folder structure required by sdkmanager
mkdir -p ~/Android/cmdline-tools/latest
mv cmdline-tools/* ~/Android/cmdline-tools/latest/
rm -rf cmdline-tools commandlinetools-linux-14742923_latest.zip

# 4. Set Environment Variables in .bashrc
echo "Configuring environment variables..."
if ! grep -q "ANDROID_SDK_ROOT" ~/.bashrc; then
cat << 'EOF' >> ~/.bashrc

# Flutter and Android SDK paths
export PATH="/opt/flutter/bin:$PATH"
export ANDROID_SDK_ROOT=$HOME/Android
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH
EOF
fi

# Export temporarily for immediate script usage
export PATH="/opt/flutter/bin:$PATH"
export ANDROID_SDK_ROOT=$HOME/Android
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH

# 5. Install Android SDK Components
echo "Installing Android SDK Components..."
yes | sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# 6. Accept Android Licenses
echo "Accepting Android Licenses..."
yes | flutter doctor --android-licenses

# 7. Final Verification
echo "Running Flutter Doctor..."
flutter doctor

echo "Installation complete. Please run 'source ~/.bashrc' or restart your terminal to apply the new paths."
