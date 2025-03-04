// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Overloading {
    function saySomething() public pure returns (string memory) {
        return "hello";
    }

    function saySomething(
        string calldata _string
    ) public pure returns (string memory) {
        return _string;
    }
}
