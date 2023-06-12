const User = require("../models/userModel");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

// * PATH -> /api/auth/signup
// * Signup Controller
// * API Type -> PUBLIC
const registerUser = async (req, res) => {
  try {
    let { name, mobile, email, password, isSuperUser, original } = req.body;
    if (!isSuperUser) {
      isSuperUser = false;
    }
    if (!original) {
      original = false;
    }

    const existingUser = await User.findOne({ email: email });
    if (existingUser) {
      return res.status(400).json({ error: "User already exists!" });
    }

    const hashed = await bcryptjs.hash(password, 10);

    let user = await User.create({
      name,
      email,
      mobile,
      password: hashed,
      isSuperUser: isSuperUser,
    });

    let userObj = user.toObject();
    delete userObj.password;

    const token = generateToken(
      user._id,
      email,
      user.isSuperUser,
      user.original
    );

    return res.json({ data: { token, user: userObj } });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
};

// * PATH -> /api/auth/signup
// * Login Controller
// * API Type -> PUBLIC
const loginUser = async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email: email });
    if (!user) {
      return res.status(400).json({ msg: "User not exist!" });
    }

    const isMatch = await bcryptjs.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password!" });
    }

    let userObj = user.toObject();
    delete userObj.password;

    const token = generateToken(
      user._id,
      user.email,
      user.isSuperUser,
      user.original
    );
    return res.status(200).json({ data: { token, user: userObj } });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
};

// * Logout
const logOut = (req, res, next) => {
  try {
    return res.status(200).send();
  } catch (ex) {
    next(ex);
  }
};

const generateToken = (id, email, isSuperUser, original) => {
  return jwt.sign({ id, email, isSuperUser, original }, process.env.JWT_KEY);
};

module.exports = {
  registerUser,
  loginUser,
  logOut,
};
