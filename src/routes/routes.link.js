const express = require("express");
const LinkControllers = require("../controllers/controllers.link");
const midLink = require("../middleware/middleware.link");
const midAuth = require("../middleware/middleware.authentication");
const router = express.Router();

router.post("/link", midAuth, midLink);

router.put("/link/:id", midAuth);

const linkControllers = new LinkControllers();

router.get("/link/all", linkControllers.index);
router.get("/link", midAuth, linkControllers.getLinksByUser);

router.post("/link", linkControllers.create);

router.put("/link/:id", linkControllers.update);

router.delete("/link/:id", linkControllers.delete);

router.get("/link/count", midAuth, linkControllers.getLinksCount);

router.get("/link/favorites", midAuth, linkControllers.getFavoritesLink);

router.get("/link/favorites/count", midAuth, linkControllers.getFavoritesCount);

module.exports = router;
