const express = require('express')
const routesUser = require('./routes/routes.user')
const routesLink = require('./routes/routes.link')
const routesCategory = require('./routes/routes.category')
const cors = require('cors')
require('dotenv').config()

const PORT = process.env.PORT || 3333

const app = express()

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(routesUser)
app.use(routesCategory)
app.use(routesLink)

app.listen(PORT, () => {
  console.log('Server Start...')
})