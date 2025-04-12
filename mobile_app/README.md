# AI Chat Mobile App

A beautiful mobile chat application that allows users to interact with an AI assistant, built with Flutter.

## Features

- Modern, polished UI with custom chat bubbles
- Typing indicators while waiting for AI responses
- Light and dark themes
- Auto-scrolling to the latest message
- Responsive design for different screen sizes

## Prerequisites

- Flutter (2.10.0 or higher)
- Dart (2.16.0 or higher)
- Android Studio or VS Code with Flutter/Dart plugins
- Android SDK for building the APK

## Getting Started

1. Clone this repository
2. Navigate to the project directory
3. Install dependencies:

```bash
flutter pub get
```

4. Update the API URL in `lib/services/chat_service.dart`:
   - For emulator: `http://localhost:3000/`
   - For physical device: use your computer's local network IP (e.g., `http://192.168.1.100:3000`)

5. Run the app:

```bash
flutter run
```

## Building the APK

To generate the APK file for submission, run:

```bash
flutter build apk --release
```

The APK will be available at: `build/app/outputs/flutter-apk/app-release.apk`

## Project Structure

- `lib/`
  - `main.dart` - App entry point and theme configuration
  - `models/` - Data models
    - `message.dart` - Message data model
  - `screens/` - App screens
    - `chat_screen.dart` - Main chat interface
  - `services/` - API and data services
    - `chat_service.dart` - Handles communication with the backend
  - `widgets/` - Reusable UI components
    - `chat_bubble.dart` - Message bubble design
    - `typing_indicator.dart` - Animated typing indicator

## Customization

- Theme colors can be modified in `lib/main.dart`
- Message bubble styling can be adjusted in `lib/widgets/chat_bubble.dart`
- Backend API URL can be changed in `lib/services/chat_service.dart`