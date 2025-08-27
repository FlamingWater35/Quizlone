# Quizlone

A modern, cross-platform flashcard and study application built with Flutter. Quizlone allows you to create, manage, and study your own term lists using multiple learning modes. It's designed to be simple, fast, and available on any device.

---

## ✨ Features

* **📚 Create & Manage Study Lists:** Easily create new study lists by pasting terms and definitions.
* **💾 Local Storage:** All your data is saved securely on your device.
* **💻 Cross-Platform:** A single codebase that runs on Web, Android and Windows.
* **🃏 Flashcard Mode:**
  * Smooth animations for flipping and navigating.
  * Keyboard controls (`←`, `→`, `↑`, `↓`, `Space`) for desktop users.
  * Swipe gestures for mobile navigation.
* **🧠 Learn Mode:** An intelligent study mode that quizzes you on terms and re-tests you on ones you get wrong.
* **✍️ Test Mode:**
  * Generate a test from your study list.
  * Supports both written and multiple-choice question formats.
  * View detailed results with corrections for incorrect answers.
* **🎨 Theme Customization:** Choose between System, Light, and Dark themes. Your preference is saved across sessions.
* **🔄 Data Management:**
  * **Export:** Save all your study lists to a single JSON file.
  * **Import:** Load study lists from a backup file.
  * **Delete:** Delete individual lists or all data at once.

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

* You must have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/FlamingWater35/Quizlone.git
    cd quizlone
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the code generators:**
    This project uses code generation for state management, routing, data models and localization. You must run these commands before you can run the app.

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    dart run slang # For localization
    ```

4. **Run the application:**

    ```bash
    flutter run
    ```

    You can also choose a specific device to run on, for example:

    ```bash
    flutter run -d chrome # Run on Chrome
    flutter run -d windows # Run on Windows
    ```

---

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for details.
