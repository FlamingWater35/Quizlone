import subprocess
import shutil
import os
import platform
import sys
import threading
import py7zr
import re
import glob
from colorama import Fore, Style, init as colorama_init

colorama_init(autoreset=True)

APP_NAME = "Quizlone"
REPO_NAME = "Quizlone"
INNO_SCRIPT_PATH = os.path.join("scripts", "installer_script.iss")

PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
FLUTTER_WEB_BUILD_DIR = os.path.join(PROJECT_ROOT, "build", "web")
DOCS_DIR = os.path.join(PROJECT_ROOT, "docs")
APK_OUTPUT_DIR = os.path.join(PROJECT_ROOT, "build", "app", "outputs", "apk", "release")
WINDOWS_OUTPUT_DIR = os.path.join(PROJECT_ROOT, "build", "windows", "x64", "runner", "Release")
RELEASE_DIR = os.path.join(PROJECT_ROOT, "release")


def get_sanitized_version():
    """Reads the version from pubspec.yaml and removes build metadata."""
    try:
        with open(os.path.join(PROJECT_ROOT, "pubspec.yaml"), "r") as f:
            content = f.read()
            match = re.search(r"version:\s*([0-9A-Za-z\-+.]+)", content)
            if match:
                full_version = match.group(1)
                sanitized_version = full_version.split('+')[0]
                return sanitized_version
    except Exception as e:
        print(Fore.RED + f"Could not read version from pubspec.yaml: {e}")
        return "1.0.0"


def stream_pipe(pipe, prefix, color, encoding='utf-8'):
    """Streams output from a subprocess pipe in real-time."""
    try:
        for line_bytes in iter(pipe.readline, b''):
            if not line_bytes:
                break
            try:
                line = line_bytes.decode(encoding).rstrip('\r\n')
                if '\r' in line_bytes.decode(encoding, errors='ignore') and not '\n' in line_bytes.decode(encoding, errors='ignore'):
                    print(color + prefix + line_bytes.decode(encoding, errors='ignore'), end='\r')
                elif line:
                    print(color + prefix + line)
                sys.stdout.flush()
            except UnicodeDecodeError:
                print(color + prefix + f"[RAW BYTES (decode error)]: {line_bytes!r}")
                sys.stdout.flush()
    except Exception as e:
        if not (hasattr(e, 'winerror') and e.winerror == 232):
            print(Fore.RED + f"Error streaming {prefix}: {e}")
    finally:
        if hasattr(pipe, 'close') and not pipe.closed:
            pipe.close()


def run_command_realtime_colored(command_parts, step_name, CWD=PROJECT_ROOT):
    """Executes a command and prints its output in real-time with colors."""
    print(Style.BRIGHT + Fore.CYAN + "-" * 60)
    print(Style.BRIGHT + Fore.CYAN + f"Starting: {step_name}")
    command_str = " ".join(command_parts)
    print(Style.BRIGHT + Fore.CYAN + f"Executing: {command_str} (in {CWD})")
    print(Style.BRIGHT + Fore.CYAN + "-" * 60)

    use_shell = platform.system() == "Windows"

    try:
        process = subprocess.Popen(
            command_parts,
            cwd=CWD,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=use_shell,
        )

        stdout_thread = threading.Thread(target=stream_pipe, args=(process.stdout, "[INFO]  ", Fore.GREEN))
        stderr_thread = threading.Thread(target=stream_pipe, args=(process.stderr, "[WARN]  ", Fore.YELLOW))

        stdout_thread.start()
        stderr_thread.start()
        stdout_thread.join()
        stderr_thread.join()

        return_code = process.wait()

        if return_code != 0:
            print(Fore.RED + Style.BRIGHT + f"\nERROR: {step_name} failed with exit code {return_code}.")
            exit(return_code)

        print(Fore.GREEN + Style.BRIGHT + f"\nCompleted: {step_name} successfully.")
        return True

    except FileNotFoundError:
        print(Fore.RED + Style.BRIGHT + f"ERROR: Command '{command_parts[0]}' not found. Make sure it's in your system's PATH.")
        exit(1)
    except Exception as e:
        print(Fore.RED + Style.BRIGHT + f"ERROR: An unexpected error occurred during {step_name}: {e}")
        exit(1)


APP_VERSION = get_sanitized_version()
final_release_dir = os.path.join(RELEASE_DIR, f"v{APP_VERSION}")

print(Style.BRIGHT + Fore.MAGENTA + "=" * 60)
print(Style.BRIGHT + Fore.MAGENTA + f"Starting full build process for {APP_NAME} v{APP_VERSION}...")
print(Style.BRIGHT + Fore.MAGENTA + "=" * 60)

run_command_realtime_colored(["flutter", "clean"], "Flutter Clean")
run_command_realtime_colored(["flutter", "pub", "get"], "Flutter Pub Get")
run_command_realtime_colored(["dart", "run", "build_runner", "build", "--delete-conflicting-outputs"], "Build Runner")
run_command_realtime_colored(["dart", "run", "slang"], "Build Localization")
run_command_realtime_colored(["flutter", "build", "apk", "--release", "--split-per-abi"], "Android APK Build")
run_command_realtime_colored(["flutter", "build", "windows", "--release"], "Windows Build")
run_command_realtime_colored(["flutter", "build", "web", "--wasm", "--release", f"--base-href=/{REPO_NAME}/"], "Web Build")

print(Style.BRIGHT + Fore.CYAN + "\n" + "-" * 60)
print(Style.BRIGHT + Fore.CYAN + "Processing Android APKs...")
try:
    x86_apk_path = os.path.join(APK_OUTPUT_DIR, "app-x86_64-release.apk")
    if os.path.exists(x86_apk_path):
        os.remove(x86_apk_path)
        print(Fore.YELLOW + f"Removed: {os.path.basename(x86_apk_path)}")

    for apk_file in glob.glob(os.path.join(APK_OUTPUT_DIR, "app-*-release.apk")):
        filename = os.path.basename(apk_file)
        arch = filename.replace("app-", "").replace("-release.apk", "")
        new_name = f"{APP_NAME}-{arch}.apk"
        new_path = os.path.join(APK_OUTPUT_DIR, new_name)
        os.rename(apk_file, new_path)
        print(Fore.GREEN + f"Renamed: {filename} -> {new_name}")
except Exception as e:
    print(Fore.RED + f"Error processing APKs: {e}")

print(Style.BRIGHT + Fore.CYAN + "\n" + "-" * 60)
print(Style.BRIGHT + Fore.CYAN + "Processing Windows Build...")
portable_archive_path = os.path.join(PROJECT_ROOT, "Windows-portable.7z")
if os.path.exists(portable_archive_path):
    os.remove(portable_archive_path)

print(Fore.GREEN + f"Creating portable archive: {os.path.basename(portable_archive_path)}...")
with py7zr.SevenZipFile(portable_archive_path, mode='w') as archive:
    archive.writeall(path=WINDOWS_OUTPUT_DIR, arcname="")
print(Fore.GREEN + "Portable archive created.")

if platform.system() == "Windows":
    iscc_path = ""
    possible_paths = [
        r"C:\Program Files (x86)\Inno Setup 6\ISCC.exe",
        r"C:\Program Files\Inno Setup 6\ISCC.exe"
    ]
    for path in possible_paths:
        if os.path.exists(path):
            iscc_path = path
            break
    
    if iscc_path:
        print(Fore.GREEN + f"Found Inno Setup Compiler at: {iscc_path}")
        run_command_realtime_colored([iscc_path, INNO_SCRIPT_PATH], "Compile Inno Setup Installer")
    else:
        print(Fore.YELLOW + "Inno Setup Compiler (ISCC.exe) not found in default locations.")
        print(Fore.YELLOW + "Skipping installer creation. Please install Inno Setup or add it to your PATH.")

print(Style.BRIGHT + Fore.CYAN + "\n" + "-" * 60)
print(Style.BRIGHT + Fore.CYAN + "Preparing /docs folder for GitHub Pages...")
if os.path.exists(DOCS_DIR):
    shutil.rmtree(DOCS_DIR)
shutil.copytree(FLUTTER_WEB_BUILD_DIR, DOCS_DIR)
with open(os.path.join(DOCS_DIR, ".nojekyll"), "w") as f:
    pass
print(Fore.GREEN + "Web build files copied to /docs and .nojekyll created.")

print(Style.BRIGHT + Fore.CYAN + "\n" + "-" * 60)
print(Style.BRIGHT + Fore.CYAN + f"Consolidating release files into: {final_release_dir}")
if os.path.exists(final_release_dir):
    shutil.rmtree(final_release_dir)
os.makedirs(final_release_dir, exist_ok=True)

try:
    for file in glob.glob(os.path.join(APK_OUTPUT_DIR, f"{APP_NAME}-*.apk")):
        shutil.copy(file, final_release_dir)
    shutil.move(portable_archive_path, final_release_dir)
    inno_output_dir = os.path.join(PROJECT_ROOT, "scripts", "output")
    for file in glob.glob(os.path.join(inno_output_dir, "*.exe")):
        shutil.copy(file, final_release_dir)
    print(Fore.GREEN + "All release files consolidated.")
except Exception as e:
    print(Fore.RED + f"Error consolidating files: {e}")

print(Style.BRIGHT + Fore.MAGENTA + "\n" + "=" * 60)
print(Style.BRIGHT + Fore.MAGENTA + "All build steps completed!")
print(Style.BRIGHT + Fore.MAGENTA + f"--> Final release assets are located in: {final_release_dir}")
print(Style.BRIGHT + Fore.MAGENTA + f"--> Web build for GitHub Pages is in: {DOCS_DIR}")
print(Style.BRIGHT + Fore.MAGENTA + "=" * 60)