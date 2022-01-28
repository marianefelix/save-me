const knex = require("knex");
knex.migrate.latest([config]);
const knexfile = require("../../knexfile");

const connection = knex(knexfile);

module.exports = connection;
