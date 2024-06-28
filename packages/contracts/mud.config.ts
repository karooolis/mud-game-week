import { defineWorld } from "@latticexyz/world";

export default defineWorld({
  namespace: "app",
  tables: {
    // Checkable: "bool",
    Checkboxes: {
      schema: {
        id: "bytes32",
        checked: "uint8",
      },
      key: ["id"],
    },
    Counter: {
      schema: {
        value: "uint32",
      },
      key: [],
    },
  },
});
