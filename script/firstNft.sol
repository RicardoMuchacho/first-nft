// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.24;

import {Script} from  "forge-std/Script.sol";
import {firstNFT} from "../src/firstNft.sol";

contract firstNFTScript is Script {

    function run() external returns(firstNFT){
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);
        string memory name = "NFT Mastery";
        string memory symbol = "NFTM";
        string memory baseUri = "ipfs://bafybeicv3s6negs4mke3uyavjfgfqpfspdfbmpkb5uo4iljwrtkpr6eluy/";
        firstNFT nftCollection = new firstNFT(name, symbol, baseUri); 
        vm.stopBroadcast();

        return nftCollection;
    }
}