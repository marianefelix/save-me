const Ajv = require("ajv");
const ajv = new Ajv();
const linkSchema = require("../schema/schema.link");

function validarRecurso(request, response, next) {
  const { titulo, link, favorite, category_id } = request.body;

  const linkInsert = {
    titulo,
    link,
    favorite,
    category_id,
  };

  const validate = ajv.compile(linkSchema);
  const valid = validate(linkInsert);

  if (valid) {
    next();
  } else {
    response
      .status(400)
      .json({ msg: "Dados inválidos", erros: validate.errors });
  }
}

module.exports = validarRecurso;
