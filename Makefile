.PHONY: build test deploy visualize_deployment deploy_hoodi

# Runs both nodejs and solidity tests.
test:
	@npx hardhat test nodejs
	@npx hardhat test solidity

# Just build the smart contract using the solidity compiler.
build:
	@npx hardhat build

# Deploys the contract on a test net.
# https://hardhat.org/docs/getting-started#deploying-contracts
deploy: test
	@echo "Performing a test deployment."
	@npx hardhat ignition deploy ignition/modules/Counter.ts
	@npx hardhat ignition deploy ignition/modules/HelloWorld.ts
	@npx hardhat ignition deploy ignition/modules/Voting.ts
	@npx hardhat ignition deploy ignition/modules/TaxableEarning.ts
	@npx hardhat ignition deploy ignition/modules/ShitCoin.ts

deploy_hoodi: deploy
	@npx hardhat ignition deploy ignition/modules/Counter.ts --network hoodi
	@npx hardhat ignition deploy ignition/modules/HelloWorld.ts --network hoodi
	@npx hardhat ignition deploy ignition/modules/Voting.ts --network hoodi
	@npx hardhat ignition deploy ignition/modules/TaxableEarning.ts --network hoodi
	@npx hardhat ignition deploy ignition/modules/ShitCoin.ts --network hoodi
