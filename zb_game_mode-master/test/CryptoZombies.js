const CryptoZombies = artifacts.require("CryptoZombies");
const utils = require("./helpers/utils");
const zombieNames = ["Zombie 1", "Zombie 2"];

contract("CryptoZombies", (accounts) => {
    let [alice, bob] = accounts;
    let contractInstance;
    beforeEach(async () => {
        contractInstance = await CryptoZombies.new();
    }); //end beforeEach()

    it("should be able to create a new zombie", async () => {
        
        const result = await contractInstance.createRandomZombie(zombieNames[0], {from: alice});
        assert.equal(result.receipt.status, true);
        assert.equal(result.logs[0].args.name, zombieNames[0]);
    }) //end it()

    it("should not allow two zombies", async () => {
        const result = await contractInstance.createRandomZombie(zombieNames[0], {from: alice});
        await utils.shouldThrow(contractInstance.createRandomZombie(zombieNames[1], {from: alice}));
    }) //end it()

    xcontext("with the single-step transfer scenario", async () => {
        it("should transfer a zombie", async () => {
            const result = await contractInstance.createRandomZombie(zombieNames[0], {from: alice}); //tests creating a new ERC721 for alice.
            const zombieId = new constractInstance zombieNames[0];
            await contractInstance.transferFrom(zombieId, {from: alice, bob});
            const newOwner = ownerOf(zombieId);
            assert.equal(newOwner, bob);
        }) //end it()
    }) //end context()

    xcontext("with the two-step transfer scenario", async () => {
        it("should approve and then transfer a zombie when the approved address calls transferFrom()", async () => {
            
        }) //end it()
        it("should approve and then transfer a zombie when the owner calls transferFrom()", async () => {
            
        }) //end it()
    }) //end context()
}) //end contract() and end of test