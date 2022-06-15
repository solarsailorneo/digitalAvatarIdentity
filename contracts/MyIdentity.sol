// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@erc725/smart-contracts/contracts/ERC725.sol";

/**
* @author SolarSailor
* @thanks AMT 
*/

struct identity {
    string name; // Name of the person
    string linktree; // linktree
    string photoHash; // IPFS hash of photo
    }

contract MyIdentity is ERC725 {
    // address creatorAddress;
    mapping(string => identity) identity_id;
    mapping(string => bool) public emailId;
    mapping(uint256 => bool) public contactNum;

    // constructor() ERC725(msg.sender) public {
    
    //     creatorAddress = msg.sender;  //Person who deploys this contract will be the owner
    
    // }
    




}