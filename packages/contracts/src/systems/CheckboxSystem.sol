// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import {System} from "@latticexyz/world/src/System.sol";
import {Checkboxes} from "../codegen/index.sol";

contract CheckboxSystem is System {
    function toggleChecked(bytes32 _id) public returns (bool) {
        // uint32 counter = Counter.get();
        // uint32 newValue = counter + 1;
        // Counter.set(newValue);
        // History.set(newValue, block.number, block.timestamp);

        bool checked = Checkboxes.get(_id);
        bool newChecked = !checked;
        Checkboxes.set(_id, newChecked);

        return newChecked;
    }
}
