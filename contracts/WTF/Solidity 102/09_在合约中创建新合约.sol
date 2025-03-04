// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// 在合约中创建新合约的方式有2种：
// 1.Create（new的方式）
contract A {
    string public symbol;
    uint256 public age;
    string public name;

    constructor(string memory _string) payable {
        symbol = _string;
    }

    function setAge(uint256 _age) external {
        age = _age;
    }

    function setName(string calldata _name) external {
        name = _name;
    }
}

contract B {
    function getSymbolOfA() external returns (string memory) {
        A a = new A{value: 1 ether}("WTF");
        return a.symbol();
    }

    receive() external payable {}
}
