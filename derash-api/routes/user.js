const router = require("express").Router();

const crypto = require("crypto");
const hash = crypto.createHash('sha256');

const User = require("../models/Users");

const verifyAuthorization = require("../middleware/verifyAuthorization");
const verifyAdmin = require("../middleware/verifyAdmin");

//update user
router.put("/:id", verifyAuthorization, async (req, res) => {

    if (req.body.password) {
        req.body.password = hash.update(
            req.body.password
        ).digest('hex');
    }
    try {
        const updatedUser = await User.findByIdAndUpdate(
            req.params.id,
            {
                $set: req.body,
            },
            { new: true }
        );
        res.status(200).json(updatedUser);

    } catch (error) {
        res.status(500).json(err);
    }
});
// get Users
router.get("/", verifyAdmin, async (req, res) => {
    console.log(req.query);
    const query = req.query.new;
    console.log("query", query);
    try {
        const users = query
            ? await User.find().sort({ _id: -1 }).limit(5)
            : await User.find();
        console.log(users);

        res.status(200).json(users);
    } catch (err) {
        res.status(500).json(err);
    }
});


//delete user
router.delete("/:id", verifyAuthorization, async (req, res) => {
    try {
        await User.findByIdAndDelete(req.params.id);
        res.status(200).json("User has been deleted...");
    } catch (err) {
        res.status(500).json(err);
    }
});

module.exports = router;