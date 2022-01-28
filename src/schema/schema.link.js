module.exports = {
  type: "object",
  properties: {
    id: { type: "integer" },
    link: { type: "string" },
    favorite: { type: "boolean" },
    user_id: { type: "integer" },
    category_id: { type: "integer" },
  },
  required: ["link", "favorite", "user_id", "category_id"],
  additionalProperties: false,
};
