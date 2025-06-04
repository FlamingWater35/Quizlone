import subprocess
import shutil
import os
import platform

REPO_NAME = "Quizlone"
PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))

FLUTTER_WEB_BUILD_DIR = os.path.join(PROJECT_ROOT, "build", "web")
DOCS_DIR = os.path.join(PROJECT_ROOT, "docs")
APK_OUTPUT_DIR = os.path.join(PROJECT_ROOT, "build", "app", "outputs", "apk", "release")
WINDOWS_OUTPUT_DIR = os.path.join(PROJECT_ROOT, "build", "windows", "runner", "Release")


def run_command(command_parts, step_name, CWD=PROJECT_ROOT):
    print("-" * 50)
    print(f"Starting: {step_name}")
    command_str = " ".join(command_parts)
    print(f"Executing: {command_str} (in {CWD})")

    try:
        use_shell = True if platform.system() == "Windows" else False

        process = subprocess.run(
            command_parts,
            cwd=CWD,
            check=True,
            shell=use_shell,
            text=True,
            capture_output=True,
        )
        if process.stdout:
            print("Output:\n", process.stdout)
        if process.stderr:
            print("Info/Errors:\n", process.stderr)
        print(f"Completed: {step_name} successfully.")

    except subprocess.CalledProcessError as e:
        print(f"ERROR: {step_name} failed with exit code {e.returncode}.")
        if e.stdout:
            print("Stdout:\n", e.stdout)
        if e.stderr:
            print("Stderr:\n", e.stderr)
        exit(e.returncode)

    except FileNotFoundError:
        print(
            f"ERROR: Command '{command_parts[0]}' not found. Make sure Flutter/Dart is in your PATH."
        )
        exit(1)

    except Exception as e:
        print(f"ERROR: An unexpected error occurred during {step_name}: {e}")
        exit(1)


print(f"Starting full build process for {REPO_NAME}...")
print(f"Project Root: {PROJECT_ROOT}")
print(f"Web output will be copied to: {DOCS_DIR}")
print("-" * 50)

run_command(["flutter", "clean"], "Flutter Clean")

run_command(["flutter", "pub", "get"], "Flutter Pub Get")

run_command(["dart", "run", "build_runner", "build", "--delete-conflicting-outputs"], "Build Runner")

run_command(["flutter", "build", "apk", "--release", "--split-per-abi"], "Android APK Build (Split Per ABI)")

run_command(["flutter", "build", "windows", "--release"], "Windows Build")

run_command(["flutter", "build", "web", "--release", f"--base-href=/{REPO_NAME}/"], "Web Build")

print("-" * 50)
print("Preparing /docs folder for GitHub Pages...")

if os.path.exists(DOCS_DIR):
    print(f"Removing existing {DOCS_DIR} folder...")
    shutil.rmtree(DOCS_DIR)

print(f"Creating new {DOCS_DIR} folder...")
os.makedirs(DOCS_DIR, exist_ok=True)

print(f"Copying web build from {FLUTTER_WEB_BUILD_DIR} to {DOCS_DIR}...")
if os.path.exists(FLUTTER_WEB_BUILD_DIR):
    for item_name in os.listdir(FLUTTER_WEB_BUILD_DIR):
        source_item = os.path.join(FLUTTER_WEB_BUILD_DIR, item_name)
        destination_item = os.path.join(DOCS_DIR, item_name)
        if os.path.isdir(source_item):
            shutil.copytree(source_item, destination_item, dirs_exist_ok=True)
        else:
            shutil.copy2(source_item, destination_item)
    print(f"Web build files copied to {DOCS_DIR}.")
else:
    print(f"ERROR: Web build directory {FLUTTER_WEB_BUILD_DIR} not found. Skipping copy.")

no_jekyll_path = os.path.join(DOCS_DIR, ".nojekyll")
print(f"Creating {no_jekyll_path}...")
with open(no_jekyll_path, "w") as f:
    pass

print("-" * 50)
print("All build steps completed!")
print(f"Android APKs (Split Per ABI): {APK_OUTPUT_DIR}")
print(f"Windows build: {WINDOWS_OUTPUT_DIR}")
print(f"Web build (for GitHub Pages): {DOCS_DIR}")
print("-" * 50)
