exports.up = async (knex) =>
  knex.schema.createTable("category", (table) => {
    table.increments("id").primary();
    table.string("title").notNullable();

    table.integer("user_id").references("user.id").onDelete("CASCADE");

    table.timestamp("created_at").defaultTo(knex.fn.now());
    table.timestamp("updated_at").defaultTo(knex.fn.now());
  });

exports.down = async (knex) => knex.schema.dropTable("category");
