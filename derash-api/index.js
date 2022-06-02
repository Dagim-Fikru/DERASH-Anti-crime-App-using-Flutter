
const express = require("express");
const app = express();
const mongoose = require("mongoose")
const dotenv = require("dotenv");
const cors = require("cors");
const authRoute = require("./routes/auth");


dotenv.config();

app.listen(process.env.PORT, () => {
    console.log("backend is running in on port", process.env.PORT)
})
mongoose
    .connect(process.env.MONGO_URL
        //   useNewUrlParser: true,
        //     useUnifiedTopology: true
    )
    .then(() => {
        console.log("Successfully connect to MongoDB.");

    })
    .catch(err => {
        console.error("Connection error", err);
    });

app.use(cors());
app.use(express.json());
app.use("/api/auth", authRoute);
