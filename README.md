# Digital Avatar Identity
ERC-725Y Token that stores a key-value pair, where the value is a structure containing multiple fields of information. To store the key a keccak256 one-way hash function is used (**THIS WAS DONE FOR DEMO PURPOSES ONLY**. The encryption should be done off-chain in order to prevent visibility of the key when sending information to the chain). The key is entered by the deployer when constructing. The contract inherits from the ERC-725Y standard contract, so it is guaranteed to comply with the standard at the expense of gas savings.

## Run hardhat test
`npx hardhat test`

## Run mythril
The following is a mock-test that only runs for 2 minutes. Remove the `--execution-timeout` flag if you don't need the constraint.
`myth a contracts/MyIdentity.sol --solc-json testfile.json -o jsonv2 --execution-timeout 120`

## Tests and Gas Analysis
The test tells us we only spend gas when deploying the contract, as it only runs the constructor, pure, and view functions.

![erc725_deployment_only](https://user-images.githubusercontent.com/104654584/174658086-3e4e5fdb-e07a-4145-a6d6-7ab4b3a71e5c.png)


## Ways NOT to use this contract
1. Encrypt the keys on-chain (as it is being done at the moment for demo purposes).
2. Store information on-chain in the value-pair that should **NOT** be known by everyone. You should only store information in this contract that everyone else should know.
3. Encrypt information that should **NOT** be known off-chain and store it on-chain (Don't do it).


## Next Steps
1. Use internal states to optimize for gas where pertinent.
2. Incorporate ERC-725X to add the ability to use the execute function.
3. Incorporate a system of digital claims to verify identity.
4. Find a good way for the contract to interact with sensitive data without compromising it (Preferably decentralized, but might not be possible).
