
const express = require("express");
const app = express();
const mongoose = require("mongoose")
const dotenv = require("dotenv");
const authRoute = require("./routes/auth");
const userRoute = require("./routes/user");
const bodyParser = require("body-parser")

const cors = require("cors");

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
app.use(bodyParser.urlencoded({ extended: true }));
app.use("/api/auth", authRoute);
app.use("/api/user", userRoute);

