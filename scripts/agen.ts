import { ethers, upgrades } from "hardhat";
// import '@openzeppelin/hardhat-upgrades';

async function main() {
  const agen = await ethers.deployContract("AGEN", [], {});
  const agenContract = await ethers.getContractFactory("AGEN")
  // const agenProxy = await ethers.deployContract(')
  const tokenProxy = await upgrades.deployProxy(agen)

  console.log({tokenProxy, agenContract})
  
  await agen.waitForDeployment();

  console.log(
    `AGEN Token 🚀 deployed to ${agen.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
