module.exports = {
  type: "object",
  properties: {
    id: { type: "integer" },
    name: { type: "string" },
    email: { type: "string", format: "email" },
    password: { type: "string" },
  },
  required: ["name", "email", "password"],
  additionalProperties: false,
};
