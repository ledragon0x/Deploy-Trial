import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv"
dotenv.config()

const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY

function privateKey() {
  return process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : []
}

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    hardhat: {},
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/sVwldSQ77KuuOepviwhyCCh8YTjUGyyI`,
      accounts: privateKey(),
      gasMultiplier: 1.2,
    }
  },
  etherscan: {
    apiKey: {
      sepolia: ETHERSCAN_API_KEY,
    },
  },
};

export default config;
