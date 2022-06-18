const { expect } = require("chai");

function makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * 
 charactersLength));
   }
   return result;
}

describe("MyIdentity contract", function () {
    let ownerEthers;
    let owner;
    let MyIdentity;
    let hardhatMyIdentity;
    const name = "Solar Sailor";
    const linktree = "linktr.ee/solarsailor";
    const photoHash = "linktr.ee/solarsailor";
    const key = makeid(10);
    

    beforeEach(async () => {
        [ownerEthers] = await ethers.getSigners();
        MyIdentity = await ethers.getContractFactory("MyIdentity");

        hardhatMyIdentity = await MyIdentity.deploy(key, name, linktree, photoHash);
        owner = await hardhatMyIdentity.owner();
    });


    describe("Run Tests", () => {
        it("Owner function should return same value as signer", async function () {
            expect(ownerEthers.address).to.equal(owner);
        });
    
        it("Output data called by key should match input data with delimiters", async function () {
            const dataString = name + "<CR>" + linktree + "<CR>" + photoHash;
            expect(ownerEthers.address).to.equal(owner);
            expect(await hardhatMyIdentity["getData(string)"](key)).to.equal(dataString);
        });
    });

});