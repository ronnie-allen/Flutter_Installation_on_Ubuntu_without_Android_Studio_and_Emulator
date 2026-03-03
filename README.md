# Flutter Installation Guide: Ubuntu via VS Code (No Android Studio)

===================================================================

This guide outlines the process for installing Flutter on Ubuntu for use with Visual Studio Code, specifically circumventing the need for the full Android Studio IDE and emulator.

---

## 1. Install the Flutter SDK

---

1. **Download the Flutter SDK:**

```bash
sudo apt update
sudo apt install curl git unzip xz-utils
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.2-stable.tar.xz

```

2. **Extract the Archive:**

```bash
sudo tar xf flutter_linux_3.41.2-stable.tar.xz -C /opt

```

3. **Configure the Environment Path:** Add the following export command to your `~/.bashrc` file:

```bash
export PATH="/opt/flutter/bin:$PATH"

```

Apply the configuration changes:

```bash
source ~/.bashrc

```

4. **Verify the Flutter Version:**

```bash
flutter --version

```

---

## 2. Install the Android SDK (Command-Line Only)

---

1. **Create the Android Directory Structure:**

```bash
mkdir -p ~/Android/cmdline-tools

```

2. **Download the Android Command Line Tools:**

```bash
curl -O https://dl.google.com/android/repository/commandlinetools-linux-14742923_latest.zip

```

3. **Extract and Relocate the Tools:**

```bash
unzip commandlinetools-linux-14742923_latest.zip
mv cmdline-tools ~/Android/cmdline-tools/tools

```

4. **Configure the Android SDK Path:** Append these variables to your `~/.bashrc` file:

```bash
export ANDROID_SDK_ROOT=$HOME/Android
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH

```

Apply the configuration changes:

```bash
source ~/.bashrc

```

---

## 3. Install Android SDK Components

---

1. **Install Required Platform Tools:**

```bash
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0" "cmdline-tools;latest"

```

2. **Accept the Software Licenses:**

```bash
yes | sdkmanager --licenses

```

---

## 4. Resolve License and Path Requirements

---

If `flutter doctor` indicates unresolved license issues, reformat the tool directory structure:

1. **Migrate Tools to the 'Latest' Directory:**

```bash
mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/latest
mv $ANDROID_SDK_ROOT/cmdline-tools/tools/* $ANDROID_SDK_ROOT/cmdline-tools/latest/

```

2. **Re-accept the Licenses:**

```bash
yes | sdkmanager --licenses

```

---

## 5. Final Verification

---

1. **Execute the Diagnostic Tool:**

```bash
flutter doctor

```

2. **Expected Output:**

```text
[✓] Flutter (Channel stable)
[✓] Android toolchain
[✓] Chrome
[✓] Linux toolchain
[✓] VS Code
[✓] Connected device

```

*Flutter is now configured for use with Visual Studio Code on Ubuntu.*

---
