import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("ShitCoinModule", (m) => {
  const shit_coin = m.contract("ShitCoin");
  return { shit_coin };
});
