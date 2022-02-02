exports.seed = function (knex, Promise) {
  // Deletes ALL existing entries
  return knex("category")
    .del()
    .then(function () {
      // Inserts seed entries
      return knex("category").insert([
        {
          id: 0,
          title: "Geral",
          user_id: null,
        },
      ]);
    });
};
