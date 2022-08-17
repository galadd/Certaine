// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "./CertaineERC721.sol";
import "./CertaineMember.sol";

contract CertaineFactory is CertaineMember {

    CertaineERC721[] public certificates;

    function addCertificate(
        string memory _certificateName,
        string memory _symbol,
        string memory _tokenUri
    ) public onlyCertaine {
        CertaineERC721 certificate = new CertaineERC721(
            _certificateName,
            _symbol
        );
        certificate.createCertificate(_tokenUri);
    }
}