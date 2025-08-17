import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TaxableEarningModule", (m) => {
  const taxable_earning = m.contract("TaxableEarning");
  return { taxable_earning };
});
