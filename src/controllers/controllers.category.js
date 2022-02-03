const knex = require("../database/index");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

class CategoryControllers {
  async index(request, response) {
    const id = request.user.sub;

    const linksUsuario = await knex("link").where("id", id).select();

    let idsCategorias = [];

    linksUsuario.map((link) => {
      if (!idsCategorias.includes(link.category_id)) {
        idsCategorias.push(link.category_id);
      }
    });

    let categoriesUser = [];

    for (var idCategoria of idsCategorias) {
      const categoria = await knex("category")
        .where("id", idCategoria)
        .select();
      categoriesUser.push(categoria);
    }

    return response.status(200).json(categoriesUser);
  }
  async create(request, response) {
    try {
      const { title } = request.body;

      const category_insert = {
        title,
      };

      await knex("category")
        .insert(category_insert)
        .returning("id")
        .then(function (id) {
          return response.status(200).json({
            id: Number(id),
            title: title,
          });
        });
    } catch (err) {
      return response.status(400).json({
        error: err,
      });
    }
  }
  async update(request, response) {
    try {
      const id = request.params;
      const { title } = request.body;

      const linkUpdate = {
        title,
      };

      await knex("category").update(linkUpdate).where(id);

      return response.status(200).json({
        msg: "Categoria alterada!",
      });
    } catch (err) {
      return response.status(400).json({
        error: err,
      });
    }
  }
  async delete(request, response) {
    try {
      const id = request.params.id;

      await knex("category").where("id", id).del();

      return response.status(200).json({
        msg: "Categoria deletada!",
      });
    } catch (err) {
      return response.status(400).json({
        error: err,
      });
    }
  }
  async getAllLinks(request, response) {
    const categories = await knex("category").select("*");
    return response.json(categories);
  }
  async getCategoriesCount(request, response) {
    const id = request.user.sub;

    const linksUsuario = await knex("link").where("id", id).select();

    let idsCategorias = [];

    linksUsuario.map((link) => {
      if (!idsCategorias.includes(link.category_id)) {
        idsCategorias.push(link.category_id);
      }
    });

    let categoriesUser = [];

    for (var idCategoria of idsCategorias) {
      const categoria = await knex("category")
        .where("id", idCategoria)
        .select();
      categoriesUser.push(categoria);
    }

    return response.status(200).json(categoriesUser.length);
  }
}

module.exports = CategoryControllers;
