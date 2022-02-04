const express = require("express");
const CategoryControllers = require("../controllers/controllers.category");
const midCategory = require("../middleware/middleware.category");
const midAuth = require("../middleware/middleware.authentication");
const router = express.Router();

router.post("/category", midAuth, midCategory);

router.put("/category/:id", midCategory);

const categoryControllers = new CategoryControllers();

router.get("/category", midAuth, categoryControllers.getCategoriesUser);

router.get("/category/user", midAuth, categoryControllers.index);

router.get("/category/count", midAuth, categoryControllers.getCategoriesCount);

router.get("/category/all", categoryControllers.getAllLinks);

router.post("/category", categoryControllers.create);

router.put("/category/:id", categoryControllers.update);

router.delete("/category/:id", categoryControllers.delete);

module.exports = router;
