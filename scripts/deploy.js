const hre = require("hardhat");

async function main() {
  const PNS = await hre.ethers.getContractFactory("PNS");
  const pns = await PNS.deploy();

  await pns.deployed();

  console.log("PNS deployed to:", pns.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
