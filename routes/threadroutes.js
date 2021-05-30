const express = require("express");
const router = express.Router();
const threadcontroller = require ("../controllers/threadcontroller");

router.get("/threadList", threadcontroller.threadList);
router.post("/addThread", threadcontroller.addThread);

module.exports = router;