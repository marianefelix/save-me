const knex = require('../database/index')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

class CategoryControllers {
  async index(request, response) {
    const category = await knex('category').select('*')

    return response.status(200).json(category)
  }
  async create(request, response) {

    try {

      const {
        title,
        color
      } = request.body

      const category_insert = {
        title,
        color
      }

      await knex('category').insert(category_insert)

      return response.status(200).json({
        msg: "Categoria inserida!"
      })
    }
    catch (err) {
      return response.status(400).json({
        error: err
      })
    }

  }
  async update(request, response) {

    try {
      const id = request.params
      const {
        title,
        color
      } = request.body

      const linkUpdate = {
        title,
        color
      }

      await knex('category').update(linkUpdate).where(id)

      return response.status(200).json({
        msg: 'Categoria alterada!'
      })

    } catch (err) {
      return response.status(400).json({
        error: err
      })
    }

  }
  async delete(request, response) {
    try {

      const id = request.params.id

      await knex('category').where('id', id).del()

      return response.status(200).json({
        msg: 'Categoria deletada!'
      })

    } catch (err) {
      return response.status(400).json({
        error: err
      })
    }
  }
}

module.exports = CategoryControllers