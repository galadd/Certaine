// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract CertaineERC721 is ERC721, ERC721URIStorage {

    uint256 public tokenCounter;

    constructor(string memory collectionName, string memory symbol)
        ERC721(collectionName, symbol)
    {
        tokenCounter = 0;
    }

    function createCertificate(string memory tokenUri)
        public
        returns (uint256)
    {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);

        _setTokenURI(newTokenId, tokenUri);
        tokenCounter += 1;
        return tokenCounter;
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}