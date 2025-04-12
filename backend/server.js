// File: server.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Simple responses for the AI chat
const responses = [
  "Hi there! How can I assist you today?",
  "That's an interesting question! Let me think about it...",
  "I'm your AI assistant. I'm here to help with any questions you might have.",
  "Thanks for chatting with me! Is there anything specific you'd like to know?",
  "I'm still learning, but I'll do my best to help you.",
  "What else would you like to talk about?",
  "I appreciate your question. Here's what I think...",
  "That's a great point! I hadn't considered that perspective.",
  "I'm processing your request. Just a moment please...",
  "I find that topic fascinating! Would you like to explore it further?"
];

// Chat endpoint
app.post('/chat', (req, res) => {
  const { message } = req.body;
  
  if (!message) {
    return res.status(400).json({ error: 'Message is required' });
  }
  
  // Simulate processing time (0.5 to 1.5 seconds)
  setTimeout(() => {
    // Select a random response
    const randomIndex = Math.floor(Math.random() * responses.length);
    const reply = responses[randomIndex];
    
    res.json({ reply });
  }, Math.random() * 1000 + 500);
});

// Health check endpoint
app.get('/', (req, res) => {
  res.json({ status: 'AI Chat API is running' });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});