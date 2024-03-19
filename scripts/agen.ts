import { ethers } from "hardhat";

async function main() {
  
  const lockedAmount = ethers.parseEther("0.001");

  const agen = await ethers.deployContract("AGEN", [], {});

  await agen.waitForDeployment();

  console.log(
    `AGEN Token locked with ${ethers.formatEther(
      lockedAmount
    )} and deployed to ${agen.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
