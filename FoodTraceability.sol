// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodTraceability {
    struct FoodBatch {
        string batchId;
        string productName;
        address sender;
        address receiver;
        string status;
        uint256 timestamp;
    }

    mapping(string => FoodBatch) public foodBatches;

    event BatchCreated(string batchId, string productName, address indexed sender);
    event StatusUpdated(string batchId, string status, address indexed updatedBy);

    function createBatch(string memory _batchId, string memory _productName, address _receiver) public {
        foodBatches[_batchId] = FoodBatch({
            batchId: _batchId,
            productName: _productName,
            sender: msg.sender,
            receiver: _receiver,
            status: "Origin Created",
            timestamp: block.timestamp
        });

        emit BatchCreated(_batchId, _productName, msg.sender);
    }
}