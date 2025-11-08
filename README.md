# Quizlone

[![Flutter](https://img.shields.io/badge/Flutter-3.35-blue?logo=flutter)](https://flutter.dev)
[![Latest release](https://img.shields.io/github/v/release/FlamingWater35/Quizlone)](https://github.com/FlamingWater35/Quizlone/releases)
[![Build Status](https://img.shields.io/github/actions/workflow/status/FlamingWater35/Quizlone/create-draft-release.yml?label=build)](https://github.com/FlamingWater35/Quizlone/actions/workflows/create-draft-release.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Platform](https://img.shields.io/badge/platform-Web%20%7C%20Android%20%7C%20Windows%20%7C%20Linux-purple)

**Quizlone** is a modern, cross-platform flashcard and study app built with Flutter.
Create, organize, and master your study material across multiple learning modes — anywhere, on any device.
Cloud sync keeps your progress up to date without sacrificing offline usability.

---

## 🌐 Try It Online

👉 **[Visit the Web App](https://flamingwater35.github.io/Quizlone/)**

---

## ✨ Features

### 📚 Study Tools

* **Create & Manage Lists:** Build study lists quickly by pasting terms and definitions.
* **Flashcard Mode:** Flip, swipe, or use keyboard shortcuts (`←`, `→`, `↑`, `↓`, `Space`) for fast navigation.
* **Learn Mode:** Adaptive quizzing that reinforces terms you miss.
* **Test Mode:**
  * Generate written or multiple-choice tests.
  * Review results with detailed corrections.
* **Match Mode:** Match terms and definitions against the clock — complete with local leaderboards.

### ☁️ Smart Sync & Storage

* **Cloud Sync (Optional):**
  Free account-based sync with intelligent conflict resolution — merges offline progress safely.
* **Offline Support:**
  Works fully offline; sync resumes automatically when reconnected.
* **Import / Export / Delete:**
  Backup and restore study data via JSON files.

### 💻 Experience & Customization

* **Cross-Platform:** Web, Android, Windows, and Linux from a single codebase.
* **Theme Selection:** System, Light, or Dark modes.
* **Multi-Language UI:** English, Finnish, Russian, Spanish, and Swedish.
* **UI Scaling:** Adjustable interface size for optimal readability.

---

## ⚙️ System Requirements

| Platform    | Minimum Version                                                     |
| ----------- | ------------------------------------------------------------------- |
| **Android** | Android 7.0+                                                        |
| **Windows** | Windows 10 (64-bit)+                                                |
| **Linux**   | Debian 11+ / Ubuntu 22.04+ LTS                                      |
| **Web**     | Any modern browser (Chrome, Firefox, Safari, Edge) with WebAssembly |

---

## 🛠️ Tech Stack

| Layer                | Technology                                                              |
| -------------------- | ----------------------------------------------------------------------- |
| **Framework**        | [Flutter](https://flutter.dev)                                          |
| **State Management** | [Riverpod](https://riverpod.dev)                                        |
| **Backend & Auth**   | [Supabase](https://supabase.com)                                        |
| **Local Database**   | [Hive CE](https://pub.dev/packages/hive_ce)                             |
| **Routing**          | [auto_route](https://pub.dev/packages/auto_route)                       |
| **Localization**     | [slang](https://pub.dev/packages/slang)                                 |
| **Markdown UI**      | [flutter_markdown_plus](https://pub.dev/packages/flutter_markdown_plus) |

---

## 🚀 Build from Source

### Prerequisites

* [Flutter SDK](https://flutter.dev/docs/get-started/install)
* A free [Supabase](https://supabase.com/) account (for cloud sync)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/FlamingWater35/Quizlone.git
   cd Quizlone
   ```

2. **Set up Supabase**

   * Create a Supabase project.
   * Copy the API URL and anon key from your project settings.

3. **Configure environment variables**

   ```bash
   cp .env.example .env
   ```

   Fill in your credentials:

   ```env
   SUPABASE_URL=YOUR_SUPABASE_URL
   SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
   ```

4. **Install dependencies**

   ```bash
   flutter pub get
   ```

5. **Run code generators**

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   dart run slang
   ```

6. **Launch the app**

   ```bash
   flutter run
   ```

   Or target a specific platform:

   ```bash
   flutter run -d chrome
   flutter run -d windows
   ```

---

## 📦 Production Build

Quizlone includes a Python-based build script that automates packaging for all supported platforms.

1. **Install dependencies**

   ```bash
   pip install -r scripts/requirements.txt
   ```

2. **Run the build script**

   ```bash
   python scripts/run_build.py
   ```

   Choose **option 3** for the full automated build process.

This script will:

* Clean the project.
* Build Android APKs, Windows executables, and the Web app.
* Rename and package outputs.
* (If available) Compile a Windows installer via Inno Setup.
* Place all results into a versioned `release/vX.Y.Z/` folder.

> 💡 Continuous Integration and automated releases are handled via GitHub Actions.
> See `.github/workflows/` for workflow definitions.

---

## 📜 License

Released under the **MIT License**.
See the [LICENSE](LICENSE) file for full details.
