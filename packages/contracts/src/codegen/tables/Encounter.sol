// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { EncodedLengths, EncodedLengthsLib } from "@latticexyz/store/src/EncodedLengths.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

struct EncounterData {
  bool exists;
  bytes32 monster;
  uint256 catchAttempts;
}

library Encounter {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "", name: "Encounter", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x74620000000000000000000000000000456e636f756e74657200000000000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0041030001202000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (bytes32)
  Schema constant _keySchema = Schema.wrap(0x002001005f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (bool, bytes32, uint256)
  Schema constant _valueSchema = Schema.wrap(0x00410300605f1f00000000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "player";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](3);
    fieldNames[0] = "exists";
    fieldNames[1] = "monster";
    fieldNames[2] = "catchAttempts";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get exists.
   */
  function getExists(bytes32 player) internal view returns (bool exists) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get exists.
   */
  function _getExists(bytes32 player) internal view returns (bool exists) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set exists.
   */
  function setExists(bytes32 player, bool exists) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((exists)), _fieldLayout);
  }

  /**
   * @notice Set exists.
   */
  function _setExists(bytes32 player, bool exists) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((exists)), _fieldLayout);
  }

  /**
   * @notice Get monster.
   */
  function getMonster(bytes32 player) internal view returns (bytes32 monster) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (bytes32(_blob));
  }

  /**
   * @notice Get monster.
   */
  function _getMonster(bytes32 player) internal view returns (bytes32 monster) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (bytes32(_blob));
  }

  /**
   * @notice Set monster.
   */
  function setMonster(bytes32 player, bytes32 monster) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((monster)), _fieldLayout);
  }

  /**
   * @notice Set monster.
   */
  function _setMonster(bytes32 player, bytes32 monster) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((monster)), _fieldLayout);
  }

  /**
   * @notice Get catchAttempts.
   */
  function getCatchAttempts(bytes32 player) internal view returns (uint256 catchAttempts) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get catchAttempts.
   */
  function _getCatchAttempts(bytes32 player) internal view returns (uint256 catchAttempts) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set catchAttempts.
   */
  function setCatchAttempts(bytes32 player, uint256 catchAttempts) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((catchAttempts)), _fieldLayout);
  }

  /**
   * @notice Set catchAttempts.
   */
  function _setCatchAttempts(bytes32 player, uint256 catchAttempts) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((catchAttempts)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(bytes32 player) internal view returns (EncounterData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(bytes32 player) internal view returns (EncounterData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(bytes32 player, bool exists, bytes32 monster, uint256 catchAttempts) internal {
    bytes memory _staticData = encodeStatic(exists, monster, catchAttempts);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(bytes32 player, bool exists, bytes32 monster, uint256 catchAttempts) internal {
    bytes memory _staticData = encodeStatic(exists, monster, catchAttempts);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(bytes32 player, EncounterData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.exists, _table.monster, _table.catchAttempts);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(bytes32 player, EncounterData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.exists, _table.monster, _table.catchAttempts);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (bool exists, bytes32 monster, uint256 catchAttempts) {
    exists = (_toBool(uint8(Bytes.getBytes1(_blob, 0))));

    monster = (Bytes.getBytes32(_blob, 1));

    catchAttempts = (uint256(Bytes.getBytes32(_blob, 33)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    EncodedLengths,
    bytes memory
  ) internal pure returns (EncounterData memory _table) {
    (_table.exists, _table.monster, _table.catchAttempts) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(bytes32 player) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(bytes32 player) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(bool exists, bytes32 monster, uint256 catchAttempts) internal pure returns (bytes memory) {
    return abi.encodePacked(exists, monster, catchAttempts);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    bool exists,
    bytes32 monster,
    uint256 catchAttempts
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(exists, monster, catchAttempts);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(bytes32 player) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = player;

    return _keyTuple;
  }
}

/**
 * @notice Cast a value to a bool.
 * @dev Boolean values are encoded as uint8 (1 = true, 0 = false), but Solidity doesn't allow casting between uint8 and bool.
 * @param value The uint8 value to convert.
 * @return result The boolean value.
 */
function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
