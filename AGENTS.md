# Repository Guidelines

## Project Structure & Module Organization
Keep Solidity sources in `contracts/`, pairing each contract with an optional Forge-style test named `<Contract>.t.sol`. Node-based integration tests live in `test/` and use the `node:test` runner with viem utilities. Deployment recipes sit under `ignition/modules/` (e.g., `Uber.ts`), while generated artifacts in `ignition/deployments/` should be treated as build output. Utility scripts belong in `scripts/`, and the root `justfile` defines the supported workflows.

## Build, Test, and Development Commands
- `just sync`: install Node dependencies and ensure Hardhat is available globally.
- `just build`: compile Solidity via Hardhat profiles.
- `just test` or `npx hardhat test`: run Solidity unit tests alongside the TypeScript suites.
- `npx hardhat ignition deploy ignition/modules/Uber.ts`: perform a local deployment; append `--network hoodi --verify` for Hoodi testnet pushes once secrets are configured.
- `npx hardhat keystore set HOODI_RPC_URL`: manage required RPC URLs and private keys before remote deployments.

## Coding Style & Naming Conventions
Author Solidity against pragma `^0.8.28` with two-space indentation, `PascalCase` contract names, and `camelCase` state/functions. Emit events for meaningful state changes. TypeScript follows ESM, prefers `const`, and keeps filenames descriptive (e.g., `Counter.ts`). Reuse Hardhat’s viem client helpers and keep imports sorted. Run `npx hardhat test` before submitting to catch linting or typing issues flagged during compilation.

## Testing Guidelines
For Solidity, extend `forge-std/Test.sol`, name public test functions `test_*`, and leverage fuzz helpers like `testFuzz_*` when appropriate. Surface failure reasons with `vm.expectRevert` or custom errors. TypeScript specs should mirror contract behavior, using `viem.deployContract("<Name>")` and deterministic assertions. Always execute `just test` before raising a PR and verify new deployments with a smoke test in `test/` or a temporary script.

## Commit & Pull Request Guidelines
Follow the existing history with imperative, sentence-case commits (e.g., `Add an anvil deployment`). Squash small fixups locally before review. Pull requests need a concise summary, linked issues when relevant, and a test plan showing the exact commands run (`just test`, `npx hardhat ignition deploy ...`). Include screenshots or transaction hashes for network changes. Coordinate on secret usage through the Hardhat keystore—never commit `.env`-like material.

## Environment & Secrets
Remote deployments depend on keystore entries such as `HOODI_RPC_URL`, `HOODI_PRIVATE_KEY`, and `ETHERSCAN_API_KEY`. Store them with `npx hardhat keystore set <KEY>` and confirm via `npx hardhat keystore list`. Never hardcode credentials, and prefer ephemeral RPC keys in shared demos. For local forks (Anvil or Hardhat simulators), keep the keystore empty to run tests deterministically.
