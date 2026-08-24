# Quizlone — Agent Guide

Cross-platform Flutter flashcard/study app. Web (WASM), Android, Windows, Linux. Supabase cloud sync, Hive CE local storage, Riverpod state, auto_route routing, slang i18n.

## Code Generation (required before run/build/test)

Two steps, in order:

```bash
dart run build_runner build --delete-conflicting-outputs
dart run slang
```

- `build_runner` generates `.g.dart` files (Hive adapters, Riverpod providers, auto_route router, json_serializable)
- `slang` generates translation files from `lib/i18n/*.i18n.json` → `lib/i18n/generated/`
- Generated files are checked into version control — do not hand-edit them
- CI runs both commands before every build; you must too

## Running the App

```bash
flutter run -d chrome
flutter run -d windows
flutter run
```

Secrets are injected via dart-define, not `.env`:

```bash
flutter run --dart-define-from-file=secrets.json
```

`secrets.json` needs `SUPABASE_URL` and `SUPABASE_ANON_KEY`. VS Code launch configs already use this flag.

## Testing

```bash
flutter test
flutter test test/learn_controller_test.dart   # single test
```

Tests do not need Supabase credentials — they use `FakeDatabaseService` (in-memory). Key test infrastructure:

- `test/helpers/fake_database_service.dart` — in-memory DB stub implementing the full `DatabaseService` interface
- `test/helpers/controller_harness.dart` — `createControllerContainer()` builds a `ProviderContainer` with all providers overridden
- `test/helpers/test_data.dart` — shared fixtures

## Project Structure

```
lib/
  main.dart                    # Entry point: Supabase init → Hive init → migrations → runApp
  providers/
    core/                      # auth, settings, connectivity, updater providers
    controllers/               # flashcard, learn, match, multiple_choice, test controllers
    study/                     # study list + study options providers
  screens/
    main/                      # about, controls, mode_selection, settings
    modes/                     # flashcard, learn, match, match_leaderboard, multiple_choice, test
    util/                      # input, load_list, results, start
  services/
    database_service.dart      # All Hive CRUD + cloud sync triggers
    cloud_sync_service.dart    # Supabase sync logic
    migration_service.dart     # Data migration on app update
    updater_service.dart       # In-app update logic (Android)
  models/                      # Hive-annotated data classes (term, study_list, study_group, etc.)
  routing/
    app_router.dart            # auto_route config + DeepLinkResolver
    app_router.gr.dart         # GENERATED — do not edit
  i18n/
    *.i18n.json                # Source translations (en, fr, es, it, ru, fi, sv, zh, de, pt, ja)
    generated/                 # GENERATED output — do not edit
  widgets/                     # Shared widgets (flashcard, sidebar, app_scaler, error_snackbar, etc.)
```

## CI/CD

Single workflow: `.github/workflows/create-draft-release.yml`

- **Tag push** (`v*`): builds Android APKs, Windows exe + installer, Linux tarball + AppImage → draft GitHub release
- **Push to `main`**: builds web with WASM, deploys to GitHub Pages
- All CI builds run codegen before compiling

## Build Script

```bash
pip install -r scripts/requirements.txt   # py7zr, colorama
python scripts/run_build.py               # interactive menu
```

Option 3 runs the full release process: clean → pub get → codegen → build all platforms → package → copy web to `docs/`.

## i18n

- Source files: `lib/i18n/<locale>.i18n.json`
- Config: `slang.yaml` at project root
- Generate: `dart run slang`
- Use translations via `t` global (imported from `generated/translations.g.dart`)
- Adding a new locale: create `lib/i18n/<code>.i18n.json`, run slang, add to supported locales in main.dart

## Gotchas

- **`docs/` is a build artifact** — contains compiled web output for GitHub Pages. Do not hand-edit files in it.
- **`secrets.json` is not gitignored** — contains local dev Supabase credentials. Never commit real keys.
- **New Hive model** → register adapter in `DatabaseService.init()` AND update `hive_registrar.g.dart` (generated)
- **New database method** → update `FakeDatabaseService` in `test/helpers/fake_database_service.dart` too
- **New route** → add to `app_router.dart` routes list AND `DeepLinkResolver._entries` for web deep linking support
- **Supabase secrets in CI** come from GitHub Actions secrets, not from `secrets.json`
