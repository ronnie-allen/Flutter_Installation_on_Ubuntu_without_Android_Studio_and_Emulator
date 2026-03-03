# 🚀 Flutter Installation on Ubuntu without Android Studio & Emulator

===================================================================

This guide explains how to install Flutter on Ubuntu using VS Code, without Android Studio and emulator.

---

## 📥 **1. Install Flutter SDK**

---

1. **Download Flutter SDK:**

```bash
sudo apt update
sudo apt install curl git unzip xz-utils
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.2-stable.tar.xz

```

2. **Extract Flutter:**

```bash
sudo tar xf flutter_linux_3.41.2-stable.tar.xz -C /opt

```

3. **Set Flutter Path:** Add the following lines to `~/.bashrc`:

```bash
export PATH="/opt/flutter/bin:$PATH"

```

Apply the changes:

```bash
source ~/.bashrc

```

4. **Check Flutter Version:**

```bash
flutter --version

```

---

## 📦 **2. Install Android SDK without Android Studio**

---

1. **Create Android Directory:**

```bash
mkdir -p ~/Android/cmdline-tools

```

2. **Download Command Line Tools:**

```bash
curl -O https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip

```

3. **Extract and Move Tools:**

```bash
unzip commandlinetools-linux-9477386_latest.zip
mv cmdline-tools ~/Android/cmdline-tools/tools

```

4. **Set Android SDK Path:** Add these lines to `~/.bashrc`:

```bash
export ANDROID_SDK_ROOT=$HOME/Android
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH

```

Apply the changes:

```bash
source ~/.bashrc

```

---

## ⚙️ **3. Install SDK Components**

---

1. **Install Platform Tools:**

```bash
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0" "cmdline-tools;latest"

```

2. **Accept Licenses:**

```bash
yes | sdkmanager --licenses

```

---

## 📄 **4. Fix License and Path Issues**

---

If `flutter doctor` shows license issues:

1. **Move Tools to Latest:**

```bash
mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/latest
mv $ANDROID_SDK_ROOT/cmdline-tools/tools/* $ANDROID_SDK_ROOT/cmdline-tools/latest/

```

2. **Reaccept Licenses:**

```bash
yes | sdkmanager --licenses

```

---

## ✅ **5. Final Verification**

---

1. **Check Flutter Doctor:**

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

---

🌟 *Flutter is now ready to use with VS Code on Ubuntu!* 🎉

---
