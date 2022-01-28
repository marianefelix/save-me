module.exports = {
  type: "object",
  properties: {
    id: { type: "integer" },
    title: { type: "string" },
  },
  required: ["title"],
  additionalProperties: false,
};
