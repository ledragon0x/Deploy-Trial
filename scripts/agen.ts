import { ethers, upgrades } from "hardhat";
import { UpgradeOptions } from '@openzeppelin/hardhat-upgrades';

async function main() {
  const agen = await ethers.deployContract("AGEN", [], {});
  const agenContract = await ethers.getContractFactory("AGEN")
  const agenProxy = await upgrades.deployProxy(agenContract, [], {})
  await agenProxy.waitForDeployment();
  // const proxyContract = await ethers.getContractFactory("Proxy")
  console.log({agen: {addy: agen.target, user: agen.runner}})
  
  const agenContractAddress = agen.target, 
  ownerAddress = agen.owner;

  console.log({agenContractAddress, ownerAddress, agenProxy})

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
