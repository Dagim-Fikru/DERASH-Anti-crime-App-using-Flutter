const mongoose = require("mongoose");
const ReportSchema = new mongoose.Schema({
        userId: {
            type: String,
            required: true,
        },
        date: {
            type: Date,
            required: true,
        },
        location: {
            type: String,
            required: true,
        },
        description: {
            type: String,
            required: true,
        },
        img: {
            type: String
        },
    }, {
        timestamps: true
    },

);

module.exports = mongoose.model("Report", ReportSchema);