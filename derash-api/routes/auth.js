const router = require("express").Router();

const crypto = require("crypto");
const hash = crypto.createHash('sha256');

const jwt = require("jsonwebtoken");
const User = require("../models/Users");

//sign up
router.post("/register", async (req, res) => {
    const newUser = new User({
        username: req.body.username,
        email: req.body.email,
        password: hash.update(
            req.body.password
        ).digest('hex'),
    })
    try {
        const savedUser = await newUser.save();
        console.log(savedUser);
        res.status(201).json(savedUser);
    } catch (err) {
        res.status(500).json(err);
        console.log(err)

    }
});

//sign in
router.post("/login", async (req, res) => {
    try {
        const user = await User.findOne(
            {
                email: req.body.email
            }
        );
        if (!user) {
            res.status(401).json("Wrong email");
            return
        }
        const savedPassword = user.password
        const inputPassword = hash.update(
            req.body.password
        ).digest('hex');
        if (savedPassword != inputPassword) {
            res.status(401).json("Wrong User password");
            return
        }
        console.log(user);
        console.log(user._id);
        const accessToken = jwt.sign(
            {
                id: user._id,
                isAdmin: user.isAdmin,
            },
            process.env.JWT_KEY,
            { expiresIn: "3d" }
        );
        console.log(accessToken);
        const { password, ...others } = user._doc;
        res.status(200).json({ ...others, accessToken });


    } catch (error) {
        res.status(500).json(error);
        console.log(error)
    }


})

module.exports = router;
