const errorHandler = (err, req, res, next) => {
  const statusCode = res.statusCode ? res.statusCode : 500;
  console.log("executing Error Middleware");
  res.status(statusCode).json({
    message: err.message,
    stack: err.stack,
  });
};

module.exports = {
  errorHandler,
};
