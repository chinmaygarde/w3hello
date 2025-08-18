import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("UberModule", (m) => {
  const counter = m.contract("Counter");
  m.call(counter, "incBy", [5n]);

  const hello_world = m.contract("HelloWorld");
  const shit_coin = m.contract("ShitCoin");
  const taxable_earning = m.contract("TaxableEarning");
  const voting = m.contract("Voting");
  const shit_coin1 = m.contract("ShitCoin1");
  const shit_coin2 = m.contract("ShitCoin2");

  return {
    counter,
    hello_world,
    shit_coin,
    taxable_earning,
    voting,
    shit_coin1,
    shit_coin2,
  };
});
