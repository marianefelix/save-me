const express = require("express");
const LinkControllers = require("../controllers/controllers.link");
const midLink = require("../middleware/middleware.link");
const midAuth = require("../middleware/middleware.authentication");
const router = express.Router();

router.post("/link", midAuth, midLink);

router.put("/link/:id", midLink);

const linkControllers = new LinkControllers();

router.get("/link/all", linkControllers.index);
router.get("/link", midAuth, linkControllers.getLinksByUser);

router.post("/link", linkControllers.create);

router.put("/link/:id", linkControllers.update);

router.delete("/link/:id", linkControllers.delete);

router.get("/links/count", midAuth, linkControllers.getLinksCount);

router.get("/links/favorites", midAuth, linkControllers.getFavoritesLink);

router.get(
  "/links/favorites/count",
  midAuth,
  linkControllers.getFavoritesCount
);

module.exports = router;
