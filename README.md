# to_image_bug

v3.22: Picture.toImage() crashes on Linux desktop

This code does not crash in Flutter 3.19 or Flutter 3.22 Web. I did not test Windows or macOS.

Run this example app on Linux. Click one of the two buttons on screen and the app will exit. No logs or stack traces.

This code uses an svg I found while testing that easily reproduces the crash, but I have noticed other random crashes so I assume the bug is not just with this svg.

// -----------------------------------------------

Tested on these builds of Flutter and they both have the bug.

Flutter is already up to date on channel stable
Flutter 3.22.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 5dcb86f68f (5 days ago) • 2024-05-09 07:39:20 -0500
Engine • revision f6344b75dc
Tools • Dart 3.4.0 • DevTools 2.34.3

Flutter is already up to date on channel beta
Flutter 3.22.0-0.3.pre • channel beta • https://github.com/flutter/flutter.git
Framework • revision 87b652410d (3 weeks ago) • 2024-04-23 21:41:18 -0500
Engine • revision b4bfd45986
Tools • Dart 3.4.0 (build 3.4.0-282.3.beta) • DevTools 2.34.3

// -----------------------------------------------

$ flutter doctor -v
[✓] Flutter (Channel stable, 3.22.0, on Debian GNU/Linux 12 (bookworm) 6.1.0-20-amd64, locale en_US.UTF-8)
• Flutter version 3.22.0 on channel stable at /home/steve/development/flutter
• Upstream repository https://github.com/flutter/flutter.git
• Framework revision 5dcb86f68f (5 days ago), 2024-05-09 07:39:20 -0500
• Engine revision f6344b75dc
• Dart version 3.4.0
• DevTools version 2.34.3

[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
• Android SDK at /home/steve/Android/Sdk
• Platform android-34, build-tools 34.0.0
• Java binary at: /home/steve/android-studio/jbr/bin/java
• Java version OpenJDK Runtime Environment (build 17.0.7+0-17.0.7b1000.6-10550314)
• All Android licenses accepted.

[✓] Chrome - develop for the web
• Chrome at google-chrome

[✓] Linux toolchain - develop for Linux desktop
• Debian clang version 14.0.6
• cmake version 3.25.1
• ninja version 1.11.1
• pkg-config version 1.8.1

[✓] Android Studio (version 2023.1)
• Android Studio at /home/steve/android-studio
• Flutter plugin version 77.1.2
• Dart plugin can be installed from:
🔨 https://plugins.jetbrains.com/plugin/6351-dart
• Java version OpenJDK Runtime Environment (build 17.0.7+0-17.0.7b1000.6-10550314)

[✓] VS Code (version 1.89.1)
• VS Code at /usr/share/code
• Flutter extension version 3.88.0

[✓] Connected device (2 available)
• Linux (desktop) • linux • linux-x64 • Debian GNU/Linux 12 (bookworm) 6.1.0-20-amd64
• Chrome (web) • chrome • web-javascript • Google Chrome 124.0.6367.207

[✓] Network resources
• All expected network resources are available.
