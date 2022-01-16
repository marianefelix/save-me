module.exports = {
  type: "object",
  properties: {
    id: { type: "integer" },
    title: { type: "string" },
    color: { type: "string" },

  },
  required: ["title", "color"],
  additionalProperties: false,
}