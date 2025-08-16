import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("HelloModuleModule", (m) => {
  const hello_world = m.contract("HelloWorld");
  return { hello_world };
});
