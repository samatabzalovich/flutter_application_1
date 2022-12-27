const mongoose = require("mongoose");


const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    profilePic: {
        required: true,
        type: String,
        trim: true,
        default: 'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png'
    },
    password: {
        required: true,
        type: String,
    },
    phoneNumber: {
        required: true,
        type: String,
    },
    isOnline: {
        type: Boolean,
        default: false,
    },
    groupID : [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    }]
});

const User = mongoose.model("User", userSchema);
module.exports = User;