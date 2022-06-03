const router = require("express").Router();
const verifyToken = require("../middleware/verifyToken");
const verifyAdmin = require("../middleware/verifyAdmin");
const Report = require("../models/Report");
const User = require("../models/Users");
require("dotenv").config();
const multer = require('multer')

const Station = require("../models/Station");
const NodeMailer = require("nodemailer")
    // const upload = require("../file/upload")
const myEmail = process.env.MY_EMAIL
const appPassword = process.env.MY_EMAIL_PASSWORD

const { uuidv4 } = require("uuidv4");
const { attachment } = require("express/lib/response");
const DIR = './public/';
const sendEmail = require("../middleware/gmail")
var mail = NodeMailer.createTransport({
    service: 'gmail',
    auth: {
        user: myEmail,
        pass: appPassword

    }
});


// const sendReportByGmail = (information) => {
//     console.log(information);
//     var mailOptions = {
//         // from: information.userEmail,
//         from: myEmail,   // this will be changed to user email 
//         // to: information.stationEmail,
//         to: myEmail,    /// this will be changed to station email
//         subject: 'Sending Derash Report',
//         // text: information.userInformation,
//         text: "this is the derash report",

//         // text: "hi"
//         attachments: [{
//             // filename: information.imageName,
//             // path: information.filePath
//             // name  : "report+.png",
//             filename: ' report.png',
//             path: information.imagePath
//             // path : '/home/kidus/derashapi/public/1653468158568+klllllllllllllllllogo.png'
//         }]

//     };

//     mail.sendMail(mailOptions, function (error, info) {
//         if (error) {
//             console.log("error", error);
//         } else {
//             console.log('Email sent: ' + info.response);
//         }
//     });
// }


// sendreport
router.post("/sendreport", verifyToken, async(req, res, next) => {

    const url = req.protocol + '://' + req.get('host')
    const storage = multer.diskStorage({
        destination: (req, file, cb) => {
            cb(null, DIR);
        },
        filename: (req, file, cb) => {
            const fileName = file.originalname.toLowerCase().split(' ').join('-');
            cb(null, +Date.now() + '+' + fileName)
        }
    });
    var path

    let upload = multer({ storage: storage }).single('file');
    upload(req, res, async function(err) {

        if (err) {
            return res.end("Error uploading file.");
        }

        path = req.file.path;
        console.log("apth", path);
        console.log("file upload complete");
    });
    setTimeout(async() => {

            try {
                const imagegUrl = url + '/' + path
                const userId = req.user.id
                const location = req.body.location
                console.log("userid", userId);
                const userInformation = {
                    userId: req.user.id,
                    date: req.body.date,
                    location: location,
                    description: req.body.description,
                    img: imagegUrl
                }
                console.log("informatin", userInformation)
                const newReport = new Report(
                    userInformation
                )
                console.log("NEWREPORT", newReport);

                const user = await User.findById(
                    userId
                )
                console.log("user", user);

                const station = await Station.find({ stationlocation: location })
                console.log("station", station);
                delete userInformation["userId"]
                delete userInformation["img"]
                var dirname = __dirname
                dirname = dirname.split('/')
                dirname.pop(3)
                dirname = dirname.join('/')
                const userInformationJsonString = JSON.stringify(userInformation)
                const reportImage = path
                const filePath = dirname + '/' + path

                const imageName = reportImage.split('/')[1]
                const information = {
                    stationEmail: station.stationemail,
                    userEmail: user.email,
                    userInformation: userInformationJsonString,
                    imagePath: filePath,
                    imageName: imageName
                }


                // sendReportByGmail(information)
                sendEmail(information)

                const saveReport = await newReport.save();
                res.status(201).json(saveReport);

            } catch (err) {
                res.status(500).json(err);
                console.log(err)
            }
        }, 5000)
        // const imagegUrl = url + path
        // const userId = req.user.id
        // const location = req.body.location

    // const userInformation = {
    //     userId: req.user.id,
    //     date: req.body.date,
    //     location: location,
    //     description: req.body.description,
    //     img: imagegUrl
    // }
    // const newReport = new Report(
    //     userInformation
    // )
    try {

        //     const user = await User.findById(
        //         userId
        //     )
        //     const station = await Station.find(
        //         { stationlocation: location }
        //     )
        //     delete userInformation["userId"]
        //     delete userInformation["img"]
        //     var dirname = __dirname
        //     dirname = dirname.split('/')
        //     dirname.pop(3)
        //     dirname = dirname.join('/')
        //     console.log(dirname);
        //     const userInformationJsonString = JSON.stringify(userInformation)
        //     const reportImage = path
        //     const filePath = dirname +'/'+path

        //     const imageName = reportImage.split('/')[1]
        //     const information = {
        //         stationEmail: station.stationemail,
        //         userEmail: user.email,
        //         userInformation: userInformationJsonString,
        //         imagePath: filePath,
        //         imageName: imageName
        //     }
        //     console.log("image", filePath);
        //     console.log("image", imageName);

        // sendReportByGmail(information)
        // const saveReport = await newReport.save();

        // res.status(201).json(saveReport);
    } catch (err) {
        res.status(500).json(err);
        console.log(err)
    }

});

//user get saved report
router.get("/savedreport", verifyToken, async(req, res) => {
    const userId = { userId: req.user.id }
    console.log(userId);

    try {
        const savedReport = await Report.find(userId)
        console.log(savedReport);
        res.status(201).json(savedReport);

    } catch (error) {
        res.status(500).json(err)

    }
})


//get reports
router.get("/", verifyAdmin, async(req, res) => {
    console.log(req.query);
    const query = req.query.new;
    console.log("query", query);
    try {
        const reports = query ?
            await Report.find().sort({ _id: -1 }).limit(5) :
            await Report.find();
        console.log(reports);

        res.status(200).json(reports);
    } catch (err) {
        res.status(500).json(err);
    }
});

router.get("/stats", verifyAdmin, async(req, res) => {
    console.log(req.query);
    const query = req.query.new;
    console.log("query", query);
    var location = []
    try {
        const reports = query ?
            await Report.find().sort({ _id: -1 }).limit(5) :
            await Report.find();
        console.log(reports);
        for (let i = 0; i < reports.length; i++) {
            location.push(reports[i].location)
        }
        console.log(location);
        var map = location.reduce((prev, cur) => (
            prev[cur] = prev[cur] + 1 || 1, prev
        ), {});
        console.log(map);
        res.status(200).json(map);
    } catch (err) {
        res.status(500).json(err);
    }
});
module.exports = router;