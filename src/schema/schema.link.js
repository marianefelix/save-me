module.exports = {
  type: "object",
  properties: {
    id: { type: "integer" },
    title: { type: "string" },
    link: { type: "string" },
    favorite: { type: "boolean" },
    user_id: { type: "integer" },
    category_id: { type: "integer" },
  },
  required: ["link", "category_id"],
  additionalProperties: false,
};
