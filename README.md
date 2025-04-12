# AI Chat Application (Mobile + Backend)

A full-stack AI chat application with a beautiful Flutter frontend and Node.js backend.

## Project Overview

This project consists of two main components:

1. **Mobile App**: A Flutter application with a sleek chat interface
2. **Backend API**: A Node.js REST API that responds to chat messages

## Demo Video

[Link to Loom video demonstration]

## Mobile App Features

- Modern, intuitive chat UI with custom chat bubbles
- Light and dark theme support
- Typing indicators while waiting for AI responses
- Auto-scrolling to latest messages
- Responsive design for different screen sizes

## Backend Features

- Simple REST API with a `/chat` endpoint
- JSON request/response format
- Simulated AI response system
- CORS enabled for cross-platform requests

## Getting Started

### Backend Setup

1. Navigate to the `backend` directory
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the server:
   ```bash
   npm start
   ```
   The server will run on port 3000 by default.

### Mobile App Setup

1. Navigate to the `mobile_app` directory
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Update the API URL in `lib/services/chat_service.dart`:
    (e.g., `http://localhost:3000/`)
4. Run the app:
   ```bash
   flutter run
   ```

## Building the APK

To build the Android APK:

```bash
cd mobile_app
flutter build apk --release
```

The APK will be available at: `mobile_app/build/app/outputs/flutter-apk/app-release.apk`

## Technology Stack

- **Frontend**:
  - Flutter
  - Dart
  - HTTP package for API communication
  
- **Backend**:
  - Node.js
  - Express.js
  - CORS middleware

## Project Structure

```
ai-chat-app/
├── backend/
│   ├── server.js
│   ├── package.json
│   └── README.md
└── mobile_app/
    ├── lib/
    │   ├── main.dart
    │   ├── models/
    │   ├── screens/
    │   ├── services/
    │   └── widgets/
    |   └── core/
    |   └── providers/
    ├── pubspec.yaml
    └── README.md
```