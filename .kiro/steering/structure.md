# Project Structure

## Root Layout

```
flutter_application_1/
├── lib/                    # Dart source code
├── test/                   # Test files
├── android/                # Android platform code
├── ios/                    # iOS platform code
├── web/                    # Web platform code
├── windows/                # Windows platform code
├── macos/                  # macOS platform code
├── linux/                  # Linux platform code
├── pubspec.yaml            # Dependencies and project metadata
├── analysis_options.yaml   # Linting and analyzer config
└── .kiro/                  # Kiro AI assistant config
```

## Source Code (`lib/`)

- `main.dart` — App entry point, root widget, and all UI code (currently single-file)
- As the app grows, split into subdirectories:
  - `lib/screens/` — Full-page screen widgets
  - `lib/widgets/` — Reusable UI components
  - `lib/models/` — Data models
  - `lib/services/` — Business logic and external integrations
  - `lib/utils/` — Helpers and utilities

## Tests (`test/`)

- `widget_test.dart` — Widget tests using `flutter_test`
- Mirror the `lib/` structure for test files as the project grows

## Conventions

- Widget classes use `PascalCase`
- Private state classes prefix with `_` (e.g., `_MyHomePageState`)
- Private fields and methods prefix with `_` (e.g., `_counter`, `_incrementCounter`)
- Use `const` constructors wherever possible
- Always pass `super.key` in widget constructors
- Trailing commas on multi-line widget trees for better auto-formatting
- `StatelessWidget` for widgets with no mutable state; `StatefulWidget` when state is needed
- Theme values accessed via `Theme.of(context)` — avoid hardcoded colors/styles
