const mongoose = require("mongoose");
const StationSchema = new mongoose.Schema({
        stationame: {
            type: String,

        },
        stationemail: {
            type: String,
            required: true,
            unique: true
        },
        stationlocation: {
            type: String,
            required: true,
        },
    }, {
        timestamps: true
    },

);

module.exports = mongoose.model("Station", StationSchema);