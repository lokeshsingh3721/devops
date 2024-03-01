const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.json({
    message: "hello from the docker ",
  });
});

app.listen(3000, () => {
  console.log("port is listening to the 3000");
});
