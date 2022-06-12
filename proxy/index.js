const express = require("express");
const morgan = require("morgan");
var cors = require("cors");
require("dotenv").config();
const { createProxyMiddleware } = require("http-proxy-middleware");

// Create Express Server
const app = express();
app.use(cors());

// Configuration
const PORT = 3000;
const HOST = "localhost";
const API_SERVICE_URL = `${process.env.SERVICE_URL}:${process.env.SERVICE_PORT}`;

app.use(morgan("dev"));

app.use(
  "*",
  createProxyMiddleware({
    target: API_SERVICE_URL,
    changeOrigin: true,
  })
);
app.listen(PORT, HOST, () => {
  console.log(`Starting Proxy at ${HOST}:${PORT}`);
});
