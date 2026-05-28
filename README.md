# Carbon-Offsets-Tracking-Burning-Ledger

A decentralized Smart Contract based on the Ethereum blockchain to issue, track, and retire (burn) carbon credits dynamically using the ERC20 token standard.

---

## 📌 Overview

The **CarbonCreditLedger** smart contract enables the tokenization of carbon credits. It allows an authorized administrator to mint carbon credit tokens (`GlobalCarbonCredit` - symbol: `GCC`) and allows corporate entities or users to permanently "retire" (burn) their credits to offset their carbon footprint.

---

## 🛠 Features

* **ERC20 Standard:** Built on top of OpenZeppelin's secure and community-verified ERC20 implementation.
* **Administrative Minting:** Only the authorized `minterAdmin` (contract deployer) can issue new carbon credits.
* **Carbon Credit Retirement:** Users can burn their tokens to officially log their offset metric tons, which updates a public verifiable ledger.
* **Transparency:** Every retirement emits a blockchain event for real-time tracking and auditing.

---

## 📄 Smart Contract Details

### State Variables
* `minterAdmin`: The address that deployed the contract and holds exclusive rights to mint tokens.
* `retiredCarbonCredits`: A public mapping that tracks the total amount of carbon credits permanently retired by each wallet address.

### Core Functions

#### 1. `constructor()`
Initializes the contract, sets the token name as **GlobalCarbonCredit**, symbol as **GCC**, and assigns the deployer as the `minterAdmin`.

#### 2. `mintCredits(address _to, uint256 _amount)`
* **Permission:** Only `minterAdmin`
* **Description:** Creates `_amount` of new carbon credit tokens and distributes them to the specified `_to` address.

#### 3. `retireCredits(uint256 _amount)`
* **Permission:** Public (Any token holder)
* **Description:** Burns `_amount` of tokens from the caller's balance, permanently removing them from circulation, and adds that amount to their `retiredCarbonCredits` history.

### Events
* `CreditsRetired(address indexed corporateEntity, uint256 amountMetricTons)`: Emitted instantly whenever a user burns/retires carbon credits.

---

## 🚀 Deployment & Tech Stack

* **Language:** Solidity `^0.8.20`
* **Frameworks:** Hardhat / Remix IDE
* **Dependencies:** `@openzeppelin/contracts`

### How to Run locally

1. Clone the repository:
   ```bash
   git clone [https://github.com/Ibrahim-Salman123/Carbon-Offsets-Tracking-Burning-Ledger.git](https://github.com/Ibrahim-Salman123/Carbon-Offsets-Tracking-Burning-Ledger.git)
