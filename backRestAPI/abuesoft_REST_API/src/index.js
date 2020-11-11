const express = require('express');
const app = express();

// Server settings (Port, application name, etc)
app.set('port', process.env.PORT || 3000);

// Middlewares (Functions executed before something is processed)
app.use(express.json());

// Routes (Server's URLs to process, receive, send data)
app.use(require('./routes/rol'));

// Starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port ', app.get('port'));
});