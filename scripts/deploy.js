// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  
  const BardToken = await ethers.getContractFactory("BardToken");
  const bardToken = await BardToken.deploy();
  const bardTokenAddress = bardToken.target;
  console.log("BardToken deployed to:", bardTokenAddress)
  const BarDex = await ethers.getContractFactory("BarDex");
  const barDex = await BarDex.deploy(bardTokenAddress);
  console.log("BarDex deployed to:", barDex.target);
  await bardToken.grantMinterRole(barDex.target);
  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
