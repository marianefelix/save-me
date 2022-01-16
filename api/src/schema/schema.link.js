module.exports = {
  type: "object",
  properties: {
    id: { type: "integer" },
    link: { type: "string" },
    security: { type: "boolean" },
    favorite: { type: "boolean" },
    user_id: {type: "integer"},
    category_id: { type: "integer" },

  },
  required: ["link", "security", "favorite", "user_id", "category_id"],
  additionalProperties: false,
}