// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@erc725/smart-contracts/contracts/ERC725Y.sol";

/**
* @author SolarSailor
*/

contract MyIdentity is ERC725Y {
    // address creatorAddress;

    constructor(address newOwner) ERC725Y(newOwner) public {

    }

    mapping(address => Identity) identityId;
    // mapping(string => bool) public emailId;
    // mapping(uint256 => bool) public contactNum;

    // constructor() ERC725(msg.sender) public {
    
    //     creatorAddress = msg.sender;  //Person who deploys this contract will be the owner
    
    // }
    struct Identity {
        string name; // Name of the person
        string linktree; // linktree
        string photoHash; // IPFS hash of photo
    }

    Identity id;

    // constructor (string memory name, string memory linktree, string memory photoHash) public {
    //     id.name = name;
    //     id.linktree = linktree;
    //     id.photoHash = photoHash;
    //     identityId[msg.sender] = id;
    //     setData(msg.sender, id);
    // }


    function setData(bytes32 dataKey, bytes memory dataValue) public virtual override onlyOwner {
        _setData(dataKey, dataValue);
    }
    




}