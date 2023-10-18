const {
    time,
    loadFixture,
  } = require("@nomicfoundation/hardhat-toolbox/network-helpers");
  const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
  const { expect } = require("chai");

  describe("BardToken", function () {
    async function deployBardTokenFixture() {
      const BardToken = await ethers.getContractFactory("BardToken");
      const bardToken = await BardToken.deploy();
      const bardTokenAddress = bardToken.target;
      const BarDex = await ethers.getContractFactory("BarDex");
      const barDex = await BarDex.deploy(bardTokenAddress);
      const [owner, otherAccount] = await ethers.getSigners();
      return { bardToken, barDex, owner, otherAccount};
    }
    it("Deployment", async function () {
      const { bardToken, barDex} = await loadFixture(deployBardTokenFixture);
      expect(await bardToken.name()).to.equal("BardToken");
      expect(await bardToken.symbol()).to.equal("BRDT");
    });

  });