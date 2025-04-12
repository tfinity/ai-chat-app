const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(bodyParser.json());



app.post('/chat', (req, res) => {
  const { message } = req.body;
  
  if (!message) {
    return res.status(400).json({ error: 'Message is required' });
  }

    // Simple response logic - can be replaced with AI service
    let reply = "I'm sorry, I didn't understand that.";
  
    if (message.toLowerCase().includes('hello') || message.toLowerCase().includes('hi')) {
      reply = "Hi! I'm your AI assistant. How can I help you today?";
    } else if (message.toLowerCase().includes('how are you')) {
      reply = "I'm just a computer program, but I'm functioning well!";
    } else if (message.toLowerCase().includes('bye')) {
      reply = "Goodbye! Have a great day!";
    } else if (message.toLowerCase().includes('what is your name')) {
      reply = "I'm your AI assistant. You can call me AI.";
    } else if (message.toLowerCase().includes('what is your purpose')) {
      reply = "My purpose is to help you with your questions and provide information.";
    } else if (message.toLowerCase().includes('what is your favorite color')) {
      reply = "I don't have a favorite color, but I'm blue!";
    } else if (message.toLowerCase().includes('what is your favorite food')) {
      reply = "I'm a computer program, so I don't eat food.";
    } else if (message.toLowerCase().includes('what is your favorite movie')) {
      reply = "I don't have a favorite movie, but I'm a fan of The Matrix.";
    }
    

  setTimeout(() => {
    res.json({ reply });
  }, 3000);
});

app.get('/', (req, res) => {
  res.json({ status: 'AI Chat API is running' });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});