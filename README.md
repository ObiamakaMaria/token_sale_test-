#  Token Sale Smart Contract

A Cairo-based smart contract deployed on Starknet designed to facilitate secure and flexible token sales.

This contract allows an owner to deposit tokens for sale and enables users to purchase them using a specified payment token. Built using OpenZeppelin components, it ensures strong access control and upgradeability for future enhancements.

---

## 🚀 Features

- **Token Deposit:**  
  The owner can deposit tokens into the contract and set custom prices for each.

- **Token Purchase:**  
  Users can purchase tokens by paying with an accepted ERC-20 compatible payment token.

- **Ownership Controls:**  
  Management functions are restricted to the contract owner, ensuring secure administration.

- **Upgradeable Design:**  
  Architecture supports upgrades, allowing improvements without redeploying the contract.

- **Multi-Token Support:**  
  Enables the sale of multiple types of tokens, each with its own pricing configuration.