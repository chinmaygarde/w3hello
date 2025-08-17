# W3 Hello

A sandbox where I follow along smart contract development tutorials. Nothing to see here.

## Build & Test

While all tasks can be run via `npx hardhat`, the major tasks are specified in a `Makefile` too for ease of use.

### API Keys & Endpoints

All non-deployment and verification tasks should require no API keys or custom endpoints. However deployment to the Hoodi testnet and verification of the contract of Etherscan/Blockscout requires some RPC urls and API keys to be added to Hardhat keystore. Add each of the following keys using `npk hardhat keystore set <key>` and follow prompts.


* `HOODI_RPC_URL`: I get them from https://www.alchemy.com/ but this can be from anywhere.
* `HOODI_PRIVATE_KEY`: The wallet private key when deploying on Hoodi.
* `ETHERSCAN_API_KEY`: The Etherscan API key when verifying contracts and uploading source code.


### Tasks

* `make test`: Build contracts and run Solidity and Typescript tests.
* `make deploy`: Deploy contracts to the local testnet.
* `make depoly_hoodi`: Deploy contracts to the Hoodi testnet. Does an implicit deploy to the local testnet to verify deployment.
* `npx hardhat verify --network hoodi <deployed_contract_address>`
