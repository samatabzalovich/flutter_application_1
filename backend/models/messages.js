const mongoose = require("mongoose");


const messageSchema = mongoose.Schema({
    isSeen: {
        required: true,
        type: Boolean,
        default: false
    },
    recieverId: {
        required: true,
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    repliedMessage: {
        type: String,
    },
    repliedMessageType: {
        type: String,
    },
    repliedTo: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    senderId: {
        required: true,
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    text: {
        type: String,
        required: true,
    },
    type: {
        type: String,
        required: true,
        default: 'text',
    }
}, {timestamps: true});

const User = mongoose.model("Message", messageSchema);
module.exports = User;