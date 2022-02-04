const knex = require("../database/index");

class LinkControllers {
  async index(request, response) {
    const link = await knex("link").select("*");

    return response.status(200).json(link);
  }
  async create(request, response) {
    try {
      const { titulo, link, favorite, category_id } = request.body;

      const validCategory = await knex("category")
        .where("id", category_id)
        .select()
        .first();

      if (
        validCategory.user_id === request.user.sub ||
        validCategory.user_id === null
      ) {
        const link_insert = {
          titulo,
          link,
          favorite,
          user_id: request.user.sub,
          category_id,
        };

        await knex("link").insert(link_insert);

        return response.status(200).json({
          link_insert,
        });
      }

      return response.status(400).json({
        error: "Usuário não possui está categoria!",
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
      const { titulo, link, favorite, user_id, category_id } = request.body;

      const linkUpdate = {
        titulo,
        link,
        favorite,
        user_id,
        category_id,
      };

      await knex("link").update(linkUpdate).where(id);

      return response.status(200).json({
        msg: "Link alterado!",
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

      await knex("link").where("id", id).del();

      return response.status(200).json({
        msg: "Link deletado!",
      });
    } catch (err) {
      return response.status(400).json({
        error: err,
      });
    }
  }

  async getLinksByUser(request, response) {
    const { sub } = request.user;

    const savedLinks = await knex("link").where("user_id", sub).select();

    return response.json(savedLinks);
  }

  async getLinksCount(request, response) {
    const { sub } = request.user;

    const savedLinks = await knex("link").where("user_id", sub).select();

    return response.json(savedLinks.length);
  }

  async getFavoritesLink(request, response) {
    const { sub } = request.user;

    const linksUser = await knex("link").where("user_id", sub).select();

    let favoriteLinks = [];

    for (let link of linksUser) {
      if (link.favorite === true) {
        favoriteLinks.push(link);
      }
    }

    return response.json(favoriteLinks);
  }

  async getFavoritesCount(request, response) {
    const { sub } = request.user;

    const linksUser = await knex("link").where("user_id", sub).select();

    let favoriteLinks = [];

    for (let link of linksUser) {
      if (link.favorite === true) {
        favoriteLinks.push(link);
      }
    }

    return response.json(favoriteLinks.length);
  }
}

module.exports = LinkControllers;
