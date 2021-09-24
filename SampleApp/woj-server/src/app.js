/* eslint-disable no-console */
import express from 'express';
import morgan from 'morgan';
import path from 'path';

const app = express();
app.use(express.static(path.join(__dirname, 'public')));
app.use(morgan('tiny'));

const indexHtml = path.join(__dirname, 'public', 'index.html');

app.get('/*', (req, res) => {
    res.sendFile(indexHtml);
});


export default app;
