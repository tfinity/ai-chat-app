# AI Chat Backend

This is a simple Node.js backend for the AI Chat mobile application. It provides a REST API endpoint that responds to chat messages.

## Requirements

- Node.js (v14.0.0 or higher)
- npm (v6.0.0 or higher)

## Installation

1. Clone this repository
2. Navigate to the backend directory
3. Install dependencies:

```bash
npm install
```

## Running the Server

Start the server with:

```bash
node server.js
```

The server will run on port 3000 by default. You can change this by setting the `PORT` environment variable.

## API Endpoints

### POST /chat

Send a chat message to the AI and receive a response.

**Request Format:**
```json
{
  "message": "Hello, AI!"
}
```

**Response Format:**
```json
{
  "reply": "Hi! I'm your AI assistant."
}
```

### GET /

Health check endpoint to verify the server is running.

**Response:**
```json
{
  "status": "AI Chat API is running"
}
```

## Setup for Mobile App

When running the app on a physical device or emulator, you'll need to ensure the backend URL is correctly set in the mobile app configuration.

- For emulator: Use `http://localhost:3000/` (Android emulator's special IP for localhost)
- For physical device: Use your computer's local network IP (e.g., `http://192.168.1.100:3000`)

Make sure your phone and computer are on the same network when testing with a physical device.