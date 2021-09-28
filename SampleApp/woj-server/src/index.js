import app from './app';

const PORT = process.env.PORT || 9009;

// eslint-disable-next-line no-console
app.listen(PORT, () => console.log(`server running @ http://localhost:${PORT}`));
