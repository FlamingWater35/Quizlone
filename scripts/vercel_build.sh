#!/usr/bin/env bash
set -euo pipefail

# Pin: must satisfy pubspec.lock (flutter >=3.44.0) and match local dev (3.44.8).
FLUTTER_VERSION="3.44.8"
FLUTTER_HOME="$HOME/flutter"
ARCHIVE="flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"

if [ ! -x "$FLUTTER_HOME/bin/flutter" ]; then
  curl -fsSL -o "/tmp/${ARCHIVE}" \
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${ARCHIVE}"
  tar -xJf "/tmp/${ARCHIVE}" -C "$HOME" # extracts to $HOME/flutter
  rm -f "/tmp/${ARCHIVE}"
fi
export PATH="$FLUTTER_HOME/bin:$PATH"

flutter config --no-analytics >/dev/null 2>&1 || true
flutter --version
flutter precache --web

# Fail fast: a build with empty defines compiles but boots to the error screen.
: "${SUPABASE_URL:?SUPABASE_URL env var missing}"
: "${SUPABASE_ANON_KEY:?SUPABASE_ANON_KEY env var missing}"

flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart run slang

# No --base-href: default "/" is correct for the Vercel root domain.
flutter build web --release --wasm \
  --dart-define=SUPABASE_URL="$SUPABASE_URL" \
  --dart-define=SUPABASE_ANON_KEY="$SUPABASE_ANON_KEY"
