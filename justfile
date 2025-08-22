# Runs both nodejs and solidity tests.
test:
	@npx hardhat test

# Just build the smart contract using the solidity compiler.
build:
	@npx hardhat build

# Update dependencies.
sync:
	npm install
	npm install -g hardhat

deployment_recipe := "ignition/modules/Uber.ts"

# Deploys the contract on a test net.
# https://hardhat.org/docs/getting-started#deploying-contracts
deploy: test
	@echo "Performing a test deployment."
	@npx hardhat ignition deploy {{deployment_recipe}}

# Deploy to the Hoodi network.
deploy_hoodi: deploy
	@npx hardhat ignition deploy {{deployment_recipe}} --verify --network hoodi
