# Technology Stack

## Framework & Language

- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language (SDK ^3.9.2)

## Dependencies

- `flutter`: Core Flutter SDK
- `cupertino_icons`: iOS-style icons (^1.0.8)

## Dev Dependencies

- `flutter_test`: Testing framework
- `flutter_lints`: Recommended linting rules (^5.0.0)

## Build System

Flutter's build system with platform-specific tooling for each target.

## Common Commands

### Development

```bash
# Run the app in debug mode
flutter run

# Run on specific device
flutter run -d <device_id>

# Hot reload (press 'r' in terminal while app is running)
# Hot restart (press 'R' in terminal while app is running)
```

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart
```

### Build & Analysis

```bash
# Analyze code for issues
flutter analyze

# Format code
flutter format .

# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Build for production (Android)
flutter build apk
flutter build appbundle

# Build for production (iOS)
flutter build ios

# Build for production (Web)
flutter build web
```

### Clean

```bash
# Clean build artifacts
flutter clean
```

## Code Quality

- Uses `package:flutter_lints/flutter.yaml` for linting
- Analysis options configured in `analysis_options.yaml`
