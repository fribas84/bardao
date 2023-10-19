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
      await bardToken.grantMinterRole(barDex.target);
      const [owner, otherAccount] = await ethers.getSigners();
      return { bardToken, barDex, owner, otherAccount};
    }
    it("Deployment", async function () {
      const { bardToken, barDex} = await loadFixture(deployBardTokenFixture);
      expect(await bardToken.name()).to.equal("BardToken");
      expect(await bardToken.symbol()).to.equal("BRDT");
    });
    it("Current Token Supply should be zero", async function () {
      const { bardToken, barDex} = await loadFixture(deployBardTokenFixture);
      expect(await bardToken.totalSupply()).to.equal(0);
    });
    it("User can receive token for ETH", async function () {
      const { bardToken, barDex, owner} = await loadFixture(deployBardTokenFixture);
      await barDex.swap({value: ethers.parseEther('100')});
      expect(await bardToken.balanceOf(owner.address)).to.equal(ethers.parseEther("100"));
    });
    it("Other user can receive token for ETH", async function () { 
      const { bardToken, barDex, owner, otherAccount} = await loadFixture(deployBardTokenFixture);
      await barDex.connect(otherAccount).swap({value: ethers.parseEther('100')});
      expect(await bardToken.balanceOf(otherAccount.address)).to.equal(ethers.parseEther("100"));
    });

  });