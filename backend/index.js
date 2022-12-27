const express = require("express");
var http = require("http");
const app = express();
const port = process.env.PORT || 5000;
var server = http.createServer(app);
var io = require("socket.io")(server);
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");


//middlewre
app.use(express.json());
var clients = {};

io.on("connection", (socket) => {
    console.log("connetetd");
    console.log(socket.id, "has joined");
    socket.on("signin", (id) => {
        console.log(id);
        clients[id] = socket;
        console.log(clients);
    });
    socket.on("message", (msg) => {
        console.log(msg);
        let targetId = msg.targetId;
        if (clients[targetId]) clients[targetId].emit("message", msg);
    });
});

server.listen(port, "0.0.0.0", () => {
    console.log("server started");
});