const verifyToken = require("./verifyToken");

const verifyAuthorization = (req, res, next) => {

    verifyToken(req, res, () => {
        console.log("user.id" ,req.user.id);
        console.log("user.params",req.params);
        if (req.user.id === req.params.id || req.user.isAdmin) {
            next();
        } else {
            res.status(403).json("You are not alowed to do that!");
        }
    });
}
module.exports = verifyAuthorization;
