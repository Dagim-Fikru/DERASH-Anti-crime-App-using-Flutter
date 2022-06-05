const router = require("express").Router();
const verifyAdmin = require("../middleware/verifyAdmin");
const verifyToken = require("../middleware/verifyToken");
const Station = require("../models/Station");
//register stations
router.post("/register", verifyAdmin, async(req, res) => {
    console.log("user", req.user);
    console.log("body", req.body);

    const newStation = new Station({
        stationname: req.user.stationname,
        stationemail: req.body.stationemail,
        stationlocation: req.body.stationlocation,

    })
    try {
        const saveStation = await newStation.save();
        res.status(201).json(saveStation);
    } catch (err) {
        res.status(500).json(err);
        console.log(err)

    }
});
//get stations
router.get("/", verifyToken, async(req, res) => {
    const query = req.query.new;
    try {
        const stations = query ?
            await Station.find().sort({ _id: -1 }).limit(5) :
            await Station.find();
        res.status(200).json(stations);
    } catch (err) {
        res.status(500).json(err);
    }
});

//update stations
router.put("/:id", verifyAdmin, async(req, res) => {

    try {
        const updatedStation = await Station.findByIdAndUpdate(
            req.params.id, {
                $set: req.body,
            }, { new: true }
        );
        res.status(200).json(updatedStation);

    } catch (error) {
        res.status(500).json(err);
    }
});
//delete stations
router.delete("/:id", verifyAdmin, async(req, res) => {
    try {
        console.log("boom", req.params.id);
        await Station.findByIdAndDelete(req.params.id);
        res.status(200).json("Staion has been deleted...");
    } catch (err) {
        console.log(err);
        res.status(500).json(err);
    }
});


module.exports = router;