const { expect } = require("chai");

describe("MyIdentity contract", function () {
    let ownerEthers;
    let owner;
    let MyIdentity;
    let hardhatMyIdentity;
    const name = "Solar Sailor";
    const linktree = "linktr.ee/solarsailor";
    const photoHash = "linktr.ee/solarsailor";

    beforeEach(async () => {
        [ownerEthers] = await ethers.getSigners();
        MyIdentity = await ethers.getContractFactory("MyIdentity");

        hardhatMyIdentity = await MyIdentity.deploy(name, linktree, photoHash);
        owner = await hardhatMyIdentity.owner();
    });


    describe("Run Tests", () => {
        it("Owner function should return same value as signer", async function () {
            expect(ownerEthers.address).to.equal(owner);
        });
    
        it("Output data called by key should match input data with delimiters", async function () {
            const dataString = name + "|" + linktree + "|" + photoHash;
            const hardhatMyIdentity = await MyIdentity.deploy(name, linktree, photoHash);
        
            expect(ownerEthers.address).to.equal(owner);
            expect(await hardhatMyIdentity["getData(address)"](owner)).to.equal(dataString);
        });
    });

});