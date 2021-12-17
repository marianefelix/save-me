const knex = require('../database/index')

class LinkControllers {
  async index(request, response) {
    const link = await knex('link').select('*')

    return response.status(200).json(link)
  }
  async create(request, response) {

    try {

      const {
        link,
        security,
        favorite,
        user_id,
        category_id

      } = request.body

      const link_insert = {
        link,
        security,
        favorite,
        user_id,
        category_id
      }

      await knex('link').insert(link_insert)

      return response.status(200).json({
        msg: "Link inserido!"
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
        link,
        security,
        favorite,
        user_id,
        category_id
      } = request.body

      const linkUpdate = {
        link,
        security,
        favorite,
        user_id,
        category_id
      }

      await knex('link').update(linkUpdate).where(id)

      return response.status(200).json({
        msg: 'Link alterado!'
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

      await knex('link').where('id', id).del()

      return response.status(200).json({
        msg: 'Link deletado!'
      })

    } catch (err) {
      return response.status(400).json({
        error: err
      })
    }
  }

}

module.exports = LinkControllers