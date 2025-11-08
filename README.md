# Quizlone

[![Flutter](https://img.shields.io/badge/Flutter-3.35-blue?logo=flutter)](https://flutter.dev)
[![Latest release](https://img.shields.io/github/v/release/FlamingWater35/Quizlone)](https://github.com/FlamingWater35/Quizlone/releases)
[![Build Status](https://img.shields.io/github/actions/workflow/status/FlamingWater35/Quizlone/create-draft-release.yml?label=build)](https://github.com/FlamingWater35/Quizlone/deployments)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Platform](https://img.shields.io/badge/platform-Web%20%7C%20Android%20%7C%20Windows%20%7C%20Linux-purple)

A modern, cross-platform flashcard and study application built with Flutter. Quizlone allows you to create, manage, and study your own term lists using multiple learning modes. It's designed to be simple, fast, and available on any device, with intelligent cloud sync to merge your progress across devices.

## Get started at the website

<https://flamingwater35.github.io/Quizlone/>

---

## ✨ Features

* **📚 Create & Manage Study Lists:** Easily create new study lists by pasting terms and definitions.
* **💻 Cross-Platform:** A single codebase that runs on Web, Android, Windows and Linux.
* **🃏 Flashcard Mode:**
  * Smooth animations for flipping and navigating.
  * Keyboard controls (`←`, `→`, `↑`, `↓`, `Space`) for desktop users.
  * Swipe gestures for mobile navigation.
* **🧠 Learn Mode:** An intelligent study mode that quizzes you on terms and re-tests you on ones you get wrong.
* **✍️ Test Mode:**
  * Generate a test from your study list.
  * Supports both written and multiple-choice question formats.
  * View detailed results with corrections for incorrect answers.
* **🧩 Match Mode:**
  * A fast-paced game to match terms with their definitions against the clock.
  * Local leaderboards for tracking your best times for each list.
* **☁️ Cloud Sync (Optional):** Create a free account to sync your study lists and progress. The sync logic is designed to intelligently merge changes from multiple devices, protecting offline work.
* **💾 Works Offline:** The app is fully functional offline with secure local storage. Your changes will sync automatically when you reconnect.
* **🎨 Theme Customization:** Choose between System, Light, and Dark themes.
* **🌍 Multi-Language Support:** Enjoy the app in English, Finnish, Russian, Spanish, and Swedish.
* **🔎 UI Scaling:** Adjust the user interface size for better readability on any screen.
* **🔄 Data Management:**
  * **Export:** Save all your study lists to a single JSON file.
  * **Import:** Load study lists from a backup file.
  * **Delete:** Delete individual lists or all data at once.

---

## Requirements

* **Android:** Android 7 or later
* **Windows:** Windows 10 64-bit or later
* **Linux** Debian 11 or later and Ubuntu 22.04 or later LTS recommended
* **Web:** Any modern browser with WebAssembly support (e.g., Chrome, Firefox, Safari, Edge).

---

## 🛠️ Tech Stack

* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** [Riverpod](https://riverpod.dev/)
* **Backend & Auth:** [Supabase](https://supabase.com/)
* **Local Database:** [Hive CE](https://pub.dev/packages/hive_ce)
* **Routing:** [auto_route](https://pub.dev/packages/auto_route)
* **Localization:** [slang](https://pub.dev/packages/slang)
* **UI Components:** [flutter_markdown_plus](https://pub.dev/packages/flutter_markdown_plus)

---

## 🚀 Building from Source

To get a local copy up and running, follow these simple steps.

### Prerequisites

* You must have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
* A free [Supabase](https://supabase.com/) account for cloud sync functionality.

### Installation & Configuration

1. **Clone the repository:**

    ```bash
    git clone https://github.com/FlamingWater35/Quizlone.git
    cd Quizlone
    ```

2. **Set up Supabase:**
    This project uses Supabase for authentication and cloud storage. You will need to set up your own free Supabase project to run the app locally.

3. **Configure Environment Variables:**
    The app loads your Supabase credentials from a `.env` file, which is not checked into version control.
    * Copy the example file:

        ```bash
        cp .env.example .env
        ```

    * Open the new `.env` file and fill in the `SUPABASE_URL` and `SUPABASE_ANON_KEY` from your Supabase project's API settings.

        ```env
        SUPABASE_URL=YOUR_SUPABASE_URL
        SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
        ```

4. **Install dependencies:**

    ```bash
    flutter pub get
    ```

5. **Run code generators:**
    This project uses code generation for state management, routing, data models and localization. You must run these commands before you can run the app.

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    dart run slang
    ```

6. **Run the application:**

    ```bash
    flutter run
    ```

    You can also choose a specific device to run on:

    ```bash
    flutter run -d chrome # Run on Chrome
    flutter run -d windows # Run on Windows
    ```

---

## 📦 Building for Production

The project includes a comprehensive Python build script that automates the entire build and packaging process for all platforms.

1. **Install Python dependencies:**

    ```bash
    pip install -r scripts/requirements.txt
    ```

2. **Run the build script:**

    ```bash
    python scripts/run_build.py
    ```

    After running, select option 3 to start the full build process.

    This script will:
    * Clean the project.
    * Build the Android APKs, Windows executable, and Web app.
    * Process the outputs (renaming APKs, creating a portable Windows archive).
    * Compile a Windows installer using Inno Setup (if detected).
    * Place all final release files into a versioned `release/vX.Y.Z` directory.

The entire process is also automated for CI/CD using GitHub Actions. See the `.github/workflows/` directory for details.

---

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for details.
