const verifyToken = require("./verifyToken");
const verifyAdmin = (req, res, next) => {
    console.log("its about to vrtify");

    verifyToken(req, res, () => {
        if (req.user.isAdmin) {
            next();
        } else {
            res.status(403).json("You are not alowed to do that!");
        }
    });
};

module.exports = verifyAdmin;