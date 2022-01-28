const Ajv = require("ajv");
const ajv = new Ajv();
const categorySchema = require("../schema/schema.category");

function validarCategoria(request, response, next) {
  const { title } = request.body;

  const categoryInsert = {
    title,
  };

  const validate = ajv.compile(categorySchema);
  const valid = validate(categoryInsert);

  if (valid) {
    next();
  } else {
    response
      .status(400)
      .json({ msg: "Dados inválidos", erros: validate.errors });
  }
}

module.exports = validarCategoria;
