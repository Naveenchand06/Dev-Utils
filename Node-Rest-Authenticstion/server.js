const express = require("express");
const mongoose = require("mongoose");
const authRoutes = require("./routes/authRoutes");
require("dotenv").config();
const db = require("./config/db");
const color = require("colors");

mongoose.set("strictQuery", false);
db();
const PORT = 3000 || process.env.PORT;

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// * Routes

app.use("/api/auth", authRoutes);
// app.use("/api/messages", messageRoutes);

app.listen(PORT, () => console.log(`Server runing on port ${PORT}`));
