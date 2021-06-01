const express = require("express");
const router = express.Router();
const threadcontroller = require ("../controllers/threadcontroller");
const commentcontroller = require ("../controllers/commentcontroller");

//thread
router.get("/threadList", threadcontroller.threadList);
router.post("/addThread", threadcontroller.addThread);
router.post("/updateThread", threadcontroller.updateThread);

//comments
router.post("/createComment", commentcontroller.createComment);

module.exports = router;
