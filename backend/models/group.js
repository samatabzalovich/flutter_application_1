const mongoose = require("mongoose");


const groupSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    groupPic: {
        required: true,
        type: String,
        trim: true,
        default: 'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png'
    },
    senderId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    timeSent: {
        type: Date
    },
    lastMessage: {
        type: String,
    },
    membersUid : [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    }]
});

const User = mongoose.model("User", userSchema);
module.exports = User;