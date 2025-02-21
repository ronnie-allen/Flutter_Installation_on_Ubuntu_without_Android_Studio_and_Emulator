🚀 Flutter Installation on Ubuntu without Android Studio & Emulator
===================================================================

This guide explains how to install Flutter on Ubuntu using VS Code, without Android Studio and emulator.

* * * * *

📥 **1\. Install Flutter SDK**
------------------------------

1.  **Download Flutter SDK:**

```
sudo apt update
sudo apt install curl git unzip xz-utils
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.29.0-stable.tar.xz

```

1.  **Extract Flutter:**

```
sudo tar xf flutter_linux_3.29.0-stable.tar.xz -C /opt

```

1.  **Set Flutter Path:** Add the following lines to `~/.bashrc`:

```
export PATH="/opt/flutter/bin:$PATH"

```

Apply the changes:

```
source ~/.bashrc

```

1.  **Check Flutter Version:**

```
flutter --version

```

* * * * *

📦 **2\. Install Android SDK without Android Studio**
-----------------------------------------------------

1.  **Create Android Directory:**

```
mkdir -p ~/Android/cmdline-tools

```

1.  **Download Command Line Tools:**

```
curl -O https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip

```

1.  **Extract and Move Tools:**

```
unzip commandlinetools-linux-9477386_latest.zip
mv cmdline-tools ~/Android/cmdline-tools/tools

```

1.  **Set Android SDK Path:** Add these lines to `~/.bashrc`:

```
export ANDROID_SDK_ROOT=$HOME/Android
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH

```

Apply the changes:

```
source ~/.bashrc

```

* * * * *

⚙️ **3\. Install SDK Components**
---------------------------------

1.  **Install Platform Tools:**

```
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0" "cmdline-tools;latest"

```

1.  **Accept Licenses:**

```
yes | sdkmanager --licenses

```

* * * * *

📄 **4\. Fix License and Path Issues**
--------------------------------------

If `flutter doctor` shows license issues:

1.  **Move Tools to Latest:**

```
mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/latest
mv $ANDROID_SDK_ROOT/cmdline-tools/tools/* $ANDROID_SDK_ROOT/cmdline-tools/latest/

```

1.  **Reaccept Licenses:**

```
yes | sdkmanager --licenses

```

* * * * *

✅ **5\. Final Verification**
----------------------------

1.  **Check Flutter Doctor:**

```
flutter doctor

```

1.  **Expected Output:**

```
[✓] Flutter (Channel stable)
[✓] Android toolchain
[✓] Chrome
[✓] Linux toolchain
[✓] VS Code
[✓] Connected device

```

* * * * *

🌟 *Flutter is now ready to use with VS Code on Ubuntu!* 🎉
