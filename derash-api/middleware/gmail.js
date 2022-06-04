


const NodeMailer = require("nodemailer")
const myEmail = process.env.MY_EMAIL
const appPassword = process.env.MY_EMAIL_PASSWORD
var mail = NodeMailer.createTransport({
    service: 'gmail',
    auth: {
        user: myEmail,
        pass: appPassword

    }
});

const sendEmail = (information) => {
    console.log(information);
    var mailOptions = {
        // from: information.userEmail,
        from: myEmail,   // this will be changed to user email 
        // to: information.stationEmail,
        to: myEmail,    /// this will be changed to station email
        subject: 'Sending Derash Report',
        text: information.userInformation,
        // text: "this is the derash report",

        // text: "hi"
        attachments: [{
            // filename: information.imageName,
            // path: information.filePath
            // name  : "report+.png",
            filename: ' report.png',
            path: information.imagePath
            // path : '/home/kidus/derashapi/public/1653468158568+klllllllllllllllllogo.png'
        }]

    };

    mail.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log("error", error);
        } else {
            console.log('Email sent: ' + info.response);
        }
    });
}

module.exports = sendEmail