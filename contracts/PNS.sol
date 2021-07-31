// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "./interfaces/IPNS.sol";

contract PNS is IPNS {

    mapping(address => string) override public nickname;
    mapping(string => address[]) internal _owners;
    mapping(string => mapping(address => uint256)) internal index;

    function owners(string memory _nickname) override external view returns (address[] memory) {
        return _owners[_nickname];
    }

    function set(address owner, string memory _nickname) override external {

        string memory old = nickname[owner];
        require(keccak256(abi.encodePacked(old)) != keccak256(abi.encodePacked(_nickname)));

        // remove old
        if (bytes(old).length > 0) {
            uint256 oldIndex = index[old][msg.sender];
            address[] storage oldOwners = _owners[old];
            oldOwners[oldIndex] = oldOwners[oldOwners.length - 1];
            oldOwners.pop();
            delete index[old][msg.sender];
        }

        nickname[owner] = _nickname;
        uint256 i = _owners[_nickname].length;
        _owners[_nickname].push(msg.sender);
        index[_nickname][msg.sender] = i;
    }
}
