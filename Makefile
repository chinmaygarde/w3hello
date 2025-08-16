.PHONY: build test deploy visualize_deployment

# Runs both nodejs and solidity tests.
test:
	@npx hardhat test nodejs
	@npx hardhat test solidity

# Just build the smart contract using the solidity compiler.
build:
	@npx hardhat build

# Deploys the contract on a test net.
# https://hardhat.org/docs/getting-started#deploying-contracts
deploy:
	@npx hardhat ignition deploy ignition/modules/Counter.ts --network sepolia
