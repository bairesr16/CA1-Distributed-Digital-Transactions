# CA1-Distributed-Digital-Transactions

# Food Traceability Smart Contract

A decentralized supply chain tracking system implemented in Solidity using Remix IDE.

## Features
- **Batch Creation**: Register new food items with origin details, unique ID, sender, and receiver addresses.
- **Status Updates**: Track and update operational statuses (e.g., "In Transit", "Delivered") with built-in validation checks.
- **Events**: Emits transparent blockchain events (`BatchCreated` and `StatusUpdated`) for supply chain auditing.

## Technologies Used
- Solidity (^0.8.0)
- Remix IDE
- Git & GitHub (Version Control)

## Deployment & Testing
1. Compile `FoodTraceability.sol` in Remix IDE.
2. Deploy using the **Remix VM**.
3. Execute `createBatch` to register a product.
4. Execute `updateStatus` to update its logistics status.