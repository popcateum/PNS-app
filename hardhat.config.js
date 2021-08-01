require('@nomiclabs/hardhat-waffle')
require('hardhat-abi-exporter')
const key = require('./key.json')

/**
 * @type import('hardhat/config').HardhatUserConfig
 */

module.exports = {
  solidity: '0.8.5',
  paths: {
    artifacts: './src/artifacts',
  },
  networks: {
    popcateum: {
      url: 'http://34.122.106.50:9506',
      accounts: [key.myKey],
    },
  },
  abiExporter: {
    path: './src/data/abi',
    clear: true,
    flat: true,
    spacing: 2,
  },
}
