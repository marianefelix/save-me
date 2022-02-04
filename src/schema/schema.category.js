module.exports = {
  type: "object",
  properties: {
    id: { type: "integer" },
    title: { type: "string" },
    user_id: { type: "integer" },
  },
  required: ["title"],
  additionalProperties: false,
};
