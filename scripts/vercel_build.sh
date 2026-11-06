#!/usr/bin/env bash
set -euo pipefail

# Pin: must satisfy pubspec.lock (dart >=3.13.0, flutter >=3.47.0) and match
# local dev (3.47.9). Bumping this is required whenever a dependency raises the
# SDK floor — e.g. file_saver 0.7.0 needs meta 1.19.0, which only Flutter 3.47
# ships, so an older SDK fails at `flutter pub get`.
FLUTTER_VERSION="3.47.9"
FLUTTER_HOME="$HOME/flutter"
ARCHIVE="flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${ARCHIVE}"

# Reports the SDK's framework version, or nothing when it cannot be determined.
installed_version() {
  local json="$FLUTTER_HOME/bin/cache/flutter.version.json"
  [ -f "$json" ] || return 0
  sed -n 's/.*"frameworkVersion": *"\([^"]*\)".*/\1/p' "$json" | head -n1
}

# Reuse the cached SDK only when it is the pinned version. Vercel caches $HOME
# between builds, so checking merely that the binary exists would silently keep
# building with an older SDK after FLUTTER_VERSION changes.
if [ -x "$FLUTTER_HOME/bin/flutter" ]; then
  CURRENT_VERSION="$(installed_version)"
  if [ "$CURRENT_VERSION" = "$FLUTTER_VERSION" ]; then
    echo "Reusing cached Flutter $CURRENT_VERSION"
  else
    echo "Cached Flutter is '${CURRENT_VERSION:-unknown}', want $FLUTTER_VERSION; reinstalling"
    rm -rf "$FLUTTER_HOME"
  fi
fi

if [ ! -x "$FLUTTER_HOME/bin/flutter" ]; then
  echo "Downloading Flutter $FLUTTER_VERSION"
  curl -fsSL -o "/tmp/${ARCHIVE}" "$URL"
  tar -xJf "/tmp/${ARCHIVE}" -C "$HOME" # extracts to $HOME/flutter
  rm -f "/tmp/${ARCHIVE}"
fi
export PATH="$FLUTTER_HOME/bin:$PATH"

# Vercel extracts the tarball as a different uid than the build user (root);
# without this the flutter tool's git checks exit 128 ("dubious ownership").
git config --global --add safe.directory "$FLUTTER_HOME"

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
