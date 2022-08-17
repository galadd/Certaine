// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract CertaineMember {

    /// number of certaine members
    uint public memberCount;

    /// mapping of member address to bool for validity checks
    mapping(address => bool) public memberValidity;

    /// mapping of member address to their individual struct
    mapping(address => Member) public memberByAddress;

    /// mapping of member struct id to member address
    mapping(uint256 => address) public addressById;

    struct Member {
        uint256 memberId;
        address memberAddress;
        string memberName;
        string memberDescription;
    }

    event certaineMember(
        uint256 memberId,
        address memberAddress,
        string memberName,
        string memberDescription
    );

    Member[] public members;

    function memberSignUp(string calldata _name, string calldata _description)
        external
    {
        require(bytes(_name).length > 0);
        require(bytes(_description).length > 0);
        memberCount++;
        Member memory member = Member({
            memberId: memberCount,
            memberAddress: msg.sender,
            memberName: _name,
            memberDescription: _description
        });
        memberValidity[msg.sender] = true;
        memberByAddress[msg.sender] = member;
        addressById[memberCount] = msg.sender;
        members.push(member);
        emit certaineMember(
        memberCount,
        msg.sender,
        _name,
        _description
    );
    }

    function changeDetails(uint256 _memberId, string memory _name, string memory _description) 
        external 
    {
        require(addressById[_memberId] == msg.sender);
        Member memory member = memberByAddress[msg.sender];
        member.memberName = _name;
        member.memberDescription = _description;
        members.push(member);
    }

    function getMember(uint256 _memberId) external view returns(Member memory) {
       // return memberById[_memberId];
    }

    function getAllMembers() external view returns(Member[] memory) {
        return members;
    }

    // Modifiers
    modifier onlyCertaine {
        require(memberValidity[msg.sender] == false, "You must be a Certaine member");
        _;
    }
}