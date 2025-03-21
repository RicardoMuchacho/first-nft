## Bloque 8 - Staking App

### Token Types

ERC20   - fungible
ERC721  - not fungible
ERC1155 - mix between both

### ERC721

metadata: name, description, image, attirbutes [name, values]

getTokenUri: used to get the ipfs uri with the nft metadata


### Deployments

Create a script, using the forge Script package

new functions needed to deploy:

function run() external returns(contract){} // instance of the contract inside

privateKey = vm.envUint("PRIVATE_KEY") // gets the priv key of your wallet
vm.startBroadcast(private key) // like prank, indicates the deploying address


Command to deploy:
forge script [filePath] --rpc-url [rpcUrl chainlist] --broadcast --verify


arb sepholia testnet rpc: https://arbitrum-sepolia.drpc.org

forge script ./script/NftRoyalties.sol --rpc-url https://arbitrum-sepolia.drpc.org --broadcast --verify
