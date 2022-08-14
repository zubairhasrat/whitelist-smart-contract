//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

contract Whitelist {
  uint8 public maxWhitelistedAddresses;
  uint8 public numAddressesWhitelisted;
  mapping (address => bool) public whitelistedAddresses;

  constructor (uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }

  function addAddressToWhiteList() public {
    require(!whitelistedAddresses[msg.sender], "Already whitelisted");
    require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");

    whitelistedAddresses[msg.sender] = true;
    numAddressesWhitelisted++;
  }
}