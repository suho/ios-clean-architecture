const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 8000;

app.use(bodyParser.json());

app.post('/users', (req, res) => {
    const data = {
        "id": 1,
        ...req.body
    };
    res.send(data);
});

app.get('/users/me', (req, res) => {
    const data = {
        "id": 1,
        "username": "mlsuho",
        "avatar": "0"
    };
    res.send(data);
});

app.listen(port);


