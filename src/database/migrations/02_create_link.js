exports.up = async (knex) =>
  knex.schema.createTable("link", (table) => {
    table.increments("id").primary();
    table.string("title").notNullable().defaultTo("");
    table.string("link").notNullable();
    table.boolean("favorite").notNullable().defaultTo(false);

    table
      .integer("user_id")
      .references("user.id")
      .notNullable()
      .onDelete("CASCADE");
    table
      .integer("category_id")
      .references("category.id")
      .notNullable()
      .onDelete("CASCADE");

    table.timestamp("created_at").defaultTo(knex.fn.now());
    table.timestamp("updated_at").defaultTo(knex.fn.now());
  });

exports.down = async (knex) => knex.schema.dropTable("link");