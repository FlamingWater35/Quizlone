import subprocess
import shutil
import os
import platform
import sys
import threading
from colorama import Fore, Style, init as colorama_init

colorama_init(autoreset=True)

REPO_NAME = "Quizlone"
PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))

FLUTTER_WEB_BUILD_DIR = os.path.join(PROJECT_ROOT, "build", "web")
DOCS_DIR = os.path.join(PROJECT_ROOT, "docs")
APK_OUTPUT_DIR = os.path.join(PROJECT_ROOT, "build", "app", "outputs", "apk", "release")
WINDOWS_OUTPUT_DIR = os.path.join(PROJECT_ROOT, "build", "windows", "runner", "Release")


def stream_pipe(pipe, prefix, color, encoding='utf-8'):
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
    print(Style.BRIGHT + Fore.CYAN + "-" * 60)
    print(Style.BRIGHT + Fore.CYAN + f"Starting: {step_name}")
    command_str = " ".join(command_parts)
    print(Style.BRIGHT + Fore.CYAN + f"Executing: {command_str} (in {CWD})")
    print(Style.BRIGHT + Fore.CYAN + "-" * 60)

    use_shell = True if platform.system() == "Windows" and (command_parts[0].endswith(".bat") or command_parts[0] in ["flutter", "dart"]) else False
    
    try:
        process = subprocess.Popen(
            command_parts,
            cwd=CWD,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=use_shell,
            bufsize=1
        )

        pipe_encoding = 'utf-8'

        stdout_thread = threading.Thread(target=stream_pipe, args=(process.stdout, "[INFO]  ", Fore.GREEN, pipe_encoding))
        stderr_thread = threading.Thread(target=stream_pipe, args=(process.stderr, "[WARN]  ", Fore.YELLOW, pipe_encoding)) 

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
        print(Fore.RED + Style.BRIGHT + f"ERROR: Command '{command_parts[0]}' not found. Make sure Flutter/Dart is in your PATH.")
        exit(1)
    except Exception as e:
        print(Fore.RED + Style.BRIGHT + f"ERROR: An unexpected error occurred during {step_name}: {e}")
        exit(1)

print(Style.BRIGHT + Fore.MAGENTA + "=" * 60)
print(Style.BRIGHT + Fore.MAGENTA + "Starting full build process for Quizlone...")
print(Style.BRIGHT + Fore.MAGENTA + f"Project Root: {PROJECT_ROOT}")
print(Style.BRIGHT + Fore.MAGENTA + f"Web output will be copied to: {DOCS_DIR}")
print(Style.BRIGHT + Fore.MAGENTA + "=" * 60)


run_command_realtime_colored(["flutter", "clean"], "Flutter Clean")
run_command_realtime_colored(["flutter", "pub", "get"], "Flutter Pub Get")
run_command_realtime_colored(["dart", "run", "build_runner", "build", "--delete-conflicting-outputs"], "Build Runner")
run_command_realtime_colored(["flutter", "build", "apk", "--release", "--split-per-abi"], "Android APK Build (Split Per ABI)")
run_command_realtime_colored(["flutter", "build", "windows", "--release"], "Windows Build")
run_command_realtime_colored(["flutter", "build", "web", "--release", f"--base-href=/{REPO_NAME}/"], "Web Build")

print(Style.BRIGHT + Fore.CYAN + "-" * 60)
print(Style.BRIGHT + Fore.CYAN + "Preparing /docs folder for GitHub Pages...")

if os.path.exists(DOCS_DIR):
    print(Fore.YELLOW + f"Removing existing {DOCS_DIR} folder...")
    shutil.rmtree(DOCS_DIR)

print(Fore.GREEN + f"Creating new {DOCS_DIR} folder...")
os.makedirs(DOCS_DIR, exist_ok=True)

print(Fore.GREEN + f"Copying web build from {FLUTTER_WEB_BUILD_DIR} to {DOCS_DIR}...")
if os.path.exists(FLUTTER_WEB_BUILD_DIR):
    for item_name in os.listdir(FLUTTER_WEB_BUILD_DIR):
        source_item = os.path.join(FLUTTER_WEB_BUILD_DIR, item_name)
        destination_item = os.path.join(DOCS_DIR, item_name)
        if os.path.isdir(source_item):
            shutil.copytree(source_item, destination_item, dirs_exist_ok=True)
        else:
            shutil.copy2(source_item, destination_item)
    print(Fore.GREEN + f"Web build files copied to {DOCS_DIR}.")
else:
    print(Fore.RED + Style.BRIGHT + f"ERROR: Web build directory {FLUTTER_WEB_BUILD_DIR} not found. Skipping copy.")

no_jekyll_path = os.path.join(DOCS_DIR, ".nojekyll")
print(Fore.GREEN + f"Creating {no_jekyll_path}...")
with open(no_jekyll_path, "w") as f:
    pass

print(Style.BRIGHT + Fore.MAGENTA + "=" * 60)
print(Style.BRIGHT + Fore.MAGENTA + "All build steps completed!")
print(Style.BRIGHT + Fore.MAGENTA + f"Android APKs (Split Per ABI): {APK_OUTPUT_DIR}")
print(Style.BRIGHT + Fore.MAGENTA + f"Windows build: {WINDOWS_OUTPUT_DIR}")
print(Style.BRIGHT + Fore.MAGENTA + f"Web build (for GitHub Pages): {DOCS_DIR}")
print(Style.BRIGHT + Fore.MAGENTA + "=" * 60)
