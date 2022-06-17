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
        // _size = summed size of the members of the structure
        uint _size = bytes(id.name).length + bytes(id.linktree).length + bytes(id.photoHash).length + bytes("||").length;
        bytes memory _data = new bytes(_size);

        uint i = 0;
        uint counter = 0;
        for (i = 0; i < bytes(id.name).length; i++)
        {
            _data[counter] = bytes(id.name)[i];
            counter++;
        }

        _data[counter] = bytes("|")[0];
        counter++;

        for (i = 0; i < bytes(id.linktree).length; i++)
        {
            _data[counter] = bytes(id.linktree)[i];
            counter++;
        }

        _data[counter] = bytes("|")[0];
        counter++;

        for (i = 0; i < bytes(id.photoHash).length; i++)
        {
            _data[counter] = bytes(id.photoHash)[i];
            counter++;
        }

        return (_data);
    }


    // function bytes2IdentityStruct(bytes memory data) private
    // returns (identity memory id)
    // {
    //     identity memory _id;

    //     uint i = 0;
    //     // for(i = 0; i < 4; i++)
    //     // {
    //     //     uint32 temp = uint32(data[i]);
    //     //     temp<<=8*i;
    //     //     id.name^=temp;
    //     // }

    //     bytes memory str = new bytes(data.length-4);

    //     for(i = 0; i < data.length - 4; i++)
    //     {
    //         str[i] = data[i+4];
    //     }

    //     _id.name = string(str);

    //     return (_id);
    //  }

     function bytes2String(bytes memory data) private pure
     returns(string memory) {
        string memory converted = string(data);
        return converted;
    }

    

    constructor(string memory name, string memory linktree, string memory photoHash) ERC725Y(msg.sender) {
        bytes32 _identity = bytes32(uint256(uint160(msg.sender)));
        identity memory id;
        id.name = name;
        id.linktree = linktree;
        id.photoHash = photoHash;

        setData(_identity, identityStruct2Bytes(id));

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
    

    // function getData(string memory id) public view
    // returns (string memory)
    // {
    //     return (bytes2String(getData(bytes32(uint256(uint160(id))))));
    // }

    function getData() public view
    returns (string memory)
    {
        return (bytes2String(getData(bytes32(uint256(uint160(msg.sender))))));
    }

    function getData(string memory key) public view
    returns (string memory)
    {
        bytes32 _key = stringToBytes32(key);
        return (bytes2String(getData(_key)));
    }

    function getData(address key) public view
    returns (string memory)
    {
        bytes32 _key = bytes32(uint256(uint160(key)));
        return (bytes2String(getData(_key)));
    }

    // function getData() public view
    // returns (bytes memory)
    // {
    //     return (getData(bytes32(uint256(uint160(msg.sender)))));
    // }

    
    // mapping(string => bool) public emailId;
    // mapping(uint256 => bool) public contactNum;

    // constructor() ERC725(msg.sender) public {
    
    //     creatorAddress = msg.sender;  //Person who deploys this contract will be the owner
    
    // }


    // constructor (string memory name, string memory linktree, string memory photoHash) public {
    //     id.name = name;
    //     id.linktree = linktree;
    //     id.photoHash = photoHash;
    //     identityId[msg.sender] = id;
    //     setData(msg.sender, id);
    // }


    // function setData(string memory name, string memory linktree, string memory photoHash) public virtual override onlyOwner {
    //     id.name = name;
    //     id.linktree = linktree;
    //     id.photoHash = photoHash;
    //     identityId[msg.sender] = id;
    //     setData(msg.sender, id);
    //     setData(dataKey, dataValue);
    // }
    




}