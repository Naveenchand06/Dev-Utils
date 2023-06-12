const express = require("express");
const authRouter = express.Router();

const {
  registerUser,
  loginUser,
  logOut,
} = require("../controllers/authController");
const {
  registerMiddleware,
  loginMiddleware,
} = require("../middlewares/inputMiddleware");

authRouter.post("/register", registerMiddleware, registerUser);

authRouter.post("/login", loginMiddleware, loginUser);

authRouter.post("/logout", logOut);

module.exports = authRouter;
