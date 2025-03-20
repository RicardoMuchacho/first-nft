// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.24;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Strings} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract firstNFT is ERC721 {
    using Strings for uint256;

    uint256 public currentTokenId;
    string public baseUri;
    uint256 public totalSupply = 2;

    event mintNFT(address account_, uint256 tokenId);
    constructor(string memory name_, string memory symbol_, string memory _baseUri) ERC721(name_, symbol_) {
        baseUri = _baseUri;
    }

    function mint() external {
        require(currentTokenId < totalSupply, "All NFTs minted");
        _safeMint(msg.sender, currentTokenId);

        uint256 tokenIdMinted = currentTokenId;
        currentTokenId++;

        emit mintNFT(msg.sender, tokenIdMinted);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseUri;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString(), ".json") : "";
    }
}
