// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract ConstructorAndModifier {
    address private owner;

    // 构造函数constructor
    constructor() {
        owner = msg.sender;
    }

    // 修饰器modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}
