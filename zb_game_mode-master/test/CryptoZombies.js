const CryptoZombies = artifacts.require("CryptoZombies");

contract("CryptoZombies", (accounts) => {
    let [alice, bob] = accounts;
    it("should be able to create a new zombie", async () => {
        const contractInstance = await cryptoZombies.new();
    })
}) //end contract() and end of test