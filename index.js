const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
const VERSION = process.env.APP_VERSION || '1.0.0';

app.get('/', (req, res) => {
  res.json({
    message: 'Hello from the DevOps pipeline app!',
    version: VERSION,
    hostname: require('os').hostname()
  });
});

app.get('/health' (req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}, version ${VERSION}`);
});