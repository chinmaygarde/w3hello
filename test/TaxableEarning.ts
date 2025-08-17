// We don't have Ethereum specific assertions in Hardhat 3 yet
import assert from "node:assert/strict";
import { describe, it } from "node:test";

import { network } from "hardhat";
import { parseEther } from "viem";

describe("TaxableEarning", async function () {
  const { viem } = await network.connect();

  it("Should emit a taxable event on send.", async function () {
    const taxable_earning = await viem.deployContract("TaxableEarning");
    const [ wallet_client ] = await viem.getWalletClients();
    const public_client = await viem.getPublicClient();
    const deployment_block = await public_client.getBlockNumber();
    for (var i = 0; i < 10; i++) {
      const hash = await wallet_client.sendTransaction({
        to: taxable_earning.address,
        value: parseEther("1"),
      });
      const receipt = await public_client.waitForTransactionReceipt({ hash });
      assert(receipt.status === "success");
    }
    const events = await public_client.getContractEvents({
      address: taxable_earning.address,
      abi: taxable_earning.abi,
      eventName: "TaxableEvent",
      fromBlock: deployment_block,
      strict: true,
    });
    assert.equal(events.length, 10, "There must be one taxable event");
  });
});
