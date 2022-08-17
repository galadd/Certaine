const factoryContract = artifacts.require("CertaineFactory");

module.exports = function (deployer) {
  deployer.deploy(factoryContract);
};