const hre = require("hardhat");

async function main() {
  // We get the contract to deploy
  const ResumeAnalyzer = await hre.ethers.getContractFactory("ResumeAnalyzer");
  const resumeAnalyzer = await ResumeAnalyzer.deploy();

  await resumeAnalyzer.deployed();

  console.log("ResumeAnalyzer deployed to:", resumeAnalyzer.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
