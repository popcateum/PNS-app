// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

interface IPNS {

    event Set(address indexed owner, string nickname);

    function set(address owner, string memory _nickname) external;
    function nickname(address owner) external view returns (string memory);
    function owners(string memory _nickname) external view returns (address[] memory);
}
