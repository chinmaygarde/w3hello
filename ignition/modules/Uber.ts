import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("UberModule", (m) => {
  const counter = m.contract("Counter");
  m.call(counter, "incBy", [5n]);

  const hello_world = m.contract("HelloWorld");
  const shit_coin = m.contract("ShitCoin");
  const taxable_earning = m.contract("TaxableEarning");
  const voting = m.contract("Voting");

  return { counter, hello_world, shit_coin, taxable_earning, voting };
});
