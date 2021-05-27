const {DataTypes} = require("sequelize");
const instance = require("../connection");

const comments = instance.sequelize.define("comments",{
    comment_id: {
        type: DataTypes.BIGINT,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
     },
    comment_body: {
        type: DataTypes.STRING,
        allowNull: false
    },
    author: {
        type: DataTypes.STRING,
        allowNull: false
    },
    createdAt: {
        type: Date,
        default: Date.now,
    },
});

exports.model = comments;
