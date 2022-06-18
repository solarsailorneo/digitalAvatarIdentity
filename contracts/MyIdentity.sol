// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@erc725/smart-contracts/contracts/ERC725Y.sol";

/**
* @author SolarSailor
*/

contract MyIdentity is ERC725Y {

    struct identity {
        string name; // Name of the person
        string linktree; // linktree
        string photoHash; // IPFS hash of photo
    }


    function identityStruct2Bytes(identity memory id) private pure
    returns (bytes memory data)
    {
        string memory delimiter = "<CR>";
        // _size = summed size of the members of the structure
        uint _size = bytes(id.name).length + bytes(id.linktree).length + bytes(id.photoHash).length + bytes(delimiter).length*2;
        bytes memory _data = new bytes(_size);

        

        uint i = 0;
        uint counter = 0;
        for (i = 0; i < bytes(id.name).length; i++)
        {
            _data[counter] = bytes(id.name)[i];
            counter++;
        }

        for (i = 0; i < bytes(delimiter).length; i++)
        {
            _data[counter] = bytes(delimiter)[i];
            counter++;
        }

        for (i = 0; i < bytes(id.linktree).length; i++)
        {
            _data[counter] = bytes(id.linktree)[i];
            counter++;
        }

        for (i = 0; i < bytes(delimiter).length; i++)
        {
            _data[counter] = bytes(delimiter)[i];
            counter++;
        }

        for (i = 0; i < bytes(id.photoHash).length; i++)
        {
            _data[counter] = bytes(id.photoHash)[i];
            counter++;
        }

        return (_data);
    }


     function bytes2String(bytes memory data) private pure
     returns(string memory) {
        string memory converted = string(data);
        return converted;
    }


    constructor(string memory key, string memory name, string memory linktree, string memory photoHash) ERC725Y(msg.sender) {
        bytes32 _key = keccak256(bytes(key));
        identity memory id;
        id.name = name;
        id.linktree = linktree;
        id.photoHash = photoHash;

        setData(_key, identityStruct2Bytes(id));

    }


    function stringToBytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }


    function getData() public view
    returns (string memory)
    {
        return (bytes2String(getData(bytes32(uint256(uint160(msg.sender))))));
    }


    function getData(string memory key) public view
    returns (string memory)
    {
        return (bytes2String(getData(keccak256(bytes(key)))));
    }


    function getData(address key) public view
    returns (string memory)
    {
        bytes32 _key = bytes32(uint256(uint160(key)));
        return (bytes2String(getData(_key)));
    }
    

}