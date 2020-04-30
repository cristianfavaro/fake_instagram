const express = require("express");
const router = express.Router();
const path = require("path");
const multer = require("multer");

const userController = require("../controllers/userController");
const authController = require("../controllers/authController");
const postController = require("../controllers/postController");

const isAuth = require('../middleware/isAuth')

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join("public", "posts"));
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + file.originalname);
  },
});

const upload = multer({ storage: storage });
/* GET home page. */

router.get("/", isAuth ,postController.index);

router.get("/login", authController.create);
router.post("/login", authController.store);

router.get("/registro", userController.create);
router.post("/registro", userController.store);

router.get("/publicar", postController.create);
router.post("/publicar", upload.any(), postController.store);

router.get("/home", isAuth ,postController.index);

module.exports = router;
