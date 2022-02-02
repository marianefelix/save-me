const knex = require("../database/index");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

class userControllers {
  async index(request, response) {
    const user = await knex("user").select("*");

    return response.status(200).json(user);
  }
  async create(request, response) {
    try {
      const { name, email, password } = request.body;

      const salt = await bcrypt.genSalt(10); //O inteiro passado tem relação com o processamento
      const passwordEncrypt = await bcrypt.hash(password, salt);

      const user_insert = {
        name,
        email,
        password: passwordEncrypt,
      };

      await knex("user").insert(user_insert);

      return response.status(200).json({
        msg: "Usuário inserido!",
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
      const { name, email, password } = request.body;

      const salt = await bcrypt.genSalt(10); //O inteiro passado tem relação com o processamento
      const passwordEncrypt = await bcrypt.hash(password, salt);

      const userUpdate = {
        name,
        email,
        password: passwordEncrypt,
      };

      await knex("user").update(userUpdate).where(id);

      return response.status(200).json({
        msg: "Usuário alterado!",
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

      await knex("user").where("id", id).del();

      return response.status(200).json({
        msg: "Usuário deletado!",
      });
    } catch (err) {
      return response.status(400).json({
        error: err,
      });
    }
  }
  async login(request, response) {
    try {
      const { email, password } = request.body;

      const email_find = await knex("user")
        .where("email", email)
        .select()
        .first();

      if (email_find && (await bcrypt.compare(password, email_find.password))) {
        const token = jwt.sign(
          {
            sub: email_find.id,
            iss: "saveMe_backend",
            aud: "saveMe_frontend",
            name: email_find.name,
            email: email_find.email,
          },
          process.env.ACCESS_TOKEN_SECRET
        );

        return response.status(200).json({
          token,
        });
      } else {
        return response.status(401).json({
          msg: "Falha na autenticação. Usuário ou senha inválidos!",
        });
      }
    } catch (err) {
      return response.status(400).json({
        error: err,
      });
    }
  }
}

module.exports = userControllers;
