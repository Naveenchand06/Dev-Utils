// Register Middleware
// PATH -> /api/auth/signup
const registerMiddleware = (req, res, next) => {
  const { name, mobile, email, password } = req.body;
  if (!name || !mobile || !email || !password) {
    return res.status(401).json({ error: "Invalid Inputs" });
  }
  next();
};

// Login Middleware
// PATH -> /api/auth/login
const loginMiddleware = (req, res, next) => {
  const { email, password } = req.body;
  if (!email || !password) {
    return res.status(401).json({ error: "Invalid Inputs" });
  }
  next();
};

module.exports = {
  registerMiddleware,
  loginMiddleware,
};
