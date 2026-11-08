// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
*@title FoodTracability 
*@dev Smart contract for tracking food supply chain batches, origin and status updates.
*@author Sara Baires 2024543
*/

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

/**
     * @notice Creates a new food batch in the supply chain system.
     * @dev Stores batch details in the mapping and emits a BatchCreated event.
     * @param _batchId Unique identifier for the food batch.
     * @param _productName Name or description of the food product.
     * @param _receiver Ethereum address designated as the recipient of the batch.
     */

    function createBatch(string memory _batchId, string memory _productName, address _receiver) public {
        foodBatches[_batchId] = FoodBatch({
            batchId: _batchId,
            productName: _productName,
            sender: msg.sender,
            receiver: _receiver,
            status: "Created at Origin",
            timestamp: block.timestamp
        });

        emit BatchCreated(_batchId, _productName, msg.sender);
    }

/**
     * @notice Updates the status of an existing food batch.
     * @dev Reverts if the batch does not exist. Emits a StatusUpdated event.
     * @param _batchId Unique identifier of the target batch.
     * @param _newStatus The updated operational status (e.g., "In Transit", "Delivered").
     */

        // Function to update the status of an existing food batch
    function updateStatus(string memory _batchId, string memory _newStatus) public {
        require(bytes(foodBatches[_batchId].batchId).length > 0, "Batch does not exist");
        foodBatches[_batchId].status = _newStatus;

        emit StatusUpdated(_batchId, _newStatus, msg.sender);
}
    }
