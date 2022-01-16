const express = require('express')
const LinkControllers = require('../controllers/controllers.link')
const midLink = require('../middleware/middleware.link')
const midAuth = require('../middleware/middleware.authentication')
const router = express.Router()


router.post('/link',  midAuth, midLink)

router.put('/link/:id', midLink)

const linkControllers = new LinkControllers

router.get('/link', linkControllers.index)

router.post('/link', linkControllers.create)

router.put('/link/:id', linkControllers.update)

router.delete('/link/:id', linkControllers.delete)

module.exports = router